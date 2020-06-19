import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:postgres/postgres.dart';

final _logger = Logger('database_access');

class DatabaseTransaction {
  DatabaseTransaction(this.conn);

  final PostgreSQLExecutionContext conn;
}

class DatabaseAccess {
  final tables = Tables();

  PostgreSQLConnection _conn;

  Future<PostgreSQLConnection> _connection() async {
    if (_conn != null) {
      return _conn;
    }
    final conn = PostgreSQLConnection('localhost', 5432, 'authpass',
        username: 'authpass', password: 'blubb');
    await conn.open();
    return conn;
  }

  Future<void> dispose() async {
    await _conn.close();
    _conn = null;
  }

  Future<T> run<T>(
          Future<T> Function(DatabaseTransaction transaction) block) async =>
      _transaction((conn) async {
        return await block(DatabaseTransaction(conn));
      });

  Future<T> _transaction<T>(
      Future<T> Function(PostgreSQLExecutionContext conn) queryBlock) async {
    final conn = await _connection();
    final dynamic result = await conn.transaction(queryBlock);
    if (result is T) {
      return result;
    }
    throw Exception(
        'Error running in transaction, $result (${result.runtimeType})'
        ' is not ${T.runtimeType}');
  }

  Future<void> init() async {
    _logger.finest('Initializing database.');
    await clean();
    final lastMigration = await _transaction((connection) async {
      try {
        await tables.migration.createTable(connection);
        return await tables.migration.queryLastVersion(connection);
      } catch (e, stackTrace) {
        _logger.severe('Error during migration', e, stackTrace);
        rethrow;
      }
    });
    _logger.fine('Last migration: $lastMigration');
    await _transaction((conn) async {
      final migrations = Migrations.migrations();
      for (final migration in migrations) {
        if (migration.id > lastMigration) {
          _logger.fine('Running migration ${migration.id}');
          await migration.up(conn);
        }
      }
    });

//    _database = config.database();
//    final client = _database.sqlClient;
//    _logger.finest('Running migration.');
//    await client.runInTransaction((t) async {
//      final result = await client.run(
//        SqlSourceBuilder()
//          ..write('CREATE TABLE IF NOT EXISTS ')
//          ..identifier(_TABLE_MIGRATE)
//          ..write(' (')
//          ..identifier(_COLUMN_ID)
//          ..write(' id PRIMARY KEY SERIAL, ')
//          ..identifier(_TABLE_MIGRATE_APPLIED_AT)
//          ..write(' timestamp without time zone')
//          ..identifier(_TABLE_MIGRATE_VERSION)
//          ..write('INT NOT NULL)'),
//      );
//    });
//    final table = _database.sqlClient.table('authpass_migration');
//    _database.collection(_TABLE_MIGRATE).document('1');
  }

  Future<void> clean() async {
    _logger.warning('Clearing database.');
    final tableNames = tables.allTables.expand((e) => e.tables);
    final conn = await _connection();
    await conn.transaction((connection) async {
      for (final tableName in tableNames) {
        final result =
            await connection.execute('DROP TABLE IF EXISTS $tableName');
        _logger.fine('Dropped $tableName ($result)');
      }
    });
  }
}

//extension on SqlClientBase {
//  Future<SqlStatementResult> run(SqlSourceBuilder builder) async {
//    final stmt = builder.build();
//    _logger.finest('Running SQL ${stmt.value}');
//    return execute(stmt.value, stmt.arguments);
//  }
//}

class Tables {
  final migration = MigrationTable();

  List<TableBase> get allTables => [
        migration,
      ];
}

abstract class TableBase {
  List<String> get tables;
}

abstract class TableConstants {
  // ignore: non_constant_identifier_names
  final _COLUMN_ID = 'id';
}

class Migrations {
  Migrations({
    @required this.id,
    @required this.up,
  })  : assert(id != null),
        assert(up != null);

  final int id;
  final Future<void> Function(PostgreSQLExecutionContext conn) up;

  static List<Migrations> migrations() {
    return [
      Migrations(id: 1, up: (conn) async {}),
    ];
  }
}

class MigrationTable extends TableBase with TableConstants {
  static const _TABLE_MIGRATE = 'authpass_migration';
  static const _TABLE_MIGRATE_VERSION = 'version';
  static const _TABLE_MIGRATE_APPLIED_AT = 'applied_at';

  @override
  List<String> get tables => [_TABLE_MIGRATE];

  Future<void> createTable(PostgreSQLExecutionContext connection) async {
    _logger.finest('Creating table ...');
    final result = await connection.execute('''
      CREATE TABLE IF NOT EXISTS $_TABLE_MIGRATE (
        $_COLUMN_ID SERIAL PRIMARY KEY,
        $_TABLE_MIGRATE_APPLIED_AT TIMESTAMP NOT NULL,
        $_TABLE_MIGRATE_VERSION INT NOT NULL
      );
      ''');
    _logger.fine('Got result: $result');
    if (result > 0) {
      if (result > 1) {
        throw Exception('Expected at most 1 affected row $result');
      }
    }
  }

  Future<int> queryLastVersion(PostgreSQLExecutionContext connection) async {
    final result = await connection
        .query('SELECT MAX($_TABLE_MIGRATE_VERSION) FROM $_TABLE_MIGRATE');
    final maxVersion = result.first[0] as int;
    _logger.finer('Migration version: $maxVersion');
    return maxVersion ?? 0;
  }
}

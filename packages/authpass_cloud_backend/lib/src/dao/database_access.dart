import 'package:authpass_cloud_backend/src/dao/tables/email_tables.dart';
import 'package:authpass_cloud_backend/src/dao/tables/user_tables.dart';
import 'package:authpass_cloud_backend/src/service/crypto_service.dart';
import 'package:meta/meta.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_utils/postgres_utils.dart';

class DatabaseTransaction extends DatabaseTransactionBase<AuthPassTables> {
  DatabaseTransaction(PostgreSQLExecutionContext conn, AuthPassTables tables)
      : super(conn, tables);
}

class DatabaseAccess
    extends DatabaseAccessBase<DatabaseTransaction, AuthPassTables> {
  DatabaseAccess({
    @required CryptoService cryptoService,
    @required DatabaseConfig config,
  })  : assert(config != null),
        assert(cryptoService != null),
        super(
          config: config,
          tables: AuthPassTables(cryptoService: cryptoService),
          migrations: AuthPassMigrationsProvider(),
        );

  @override
  DatabaseTransaction createDatabaseTransaction(
      PostgreSQLExecutionContext conn, AuthPassTables tables) {
    return DatabaseTransaction(conn, tables);
  }
}

class AuthPassTables extends Tables {
  AuthPassTables({
    @required CryptoService cryptoService,
  })  : user = UserTable(cryptoService: cryptoService),
        email = EmailTable(cryptoService: cryptoService);

  final UserTable user;
  final EmailTable email;

  @override
  List<TableBase> get tables => [
        migration,
        user,
      ];
}

class AuthPassMigrationsProvider
    extends MigrationsProvider<DatabaseTransaction, AuthPassTables> {
  @override
  List<Migrations<DatabaseTransaction, AuthPassTables>> get migrations {
    return [
      Migrations(
          id: 1,
          up: (conn) async {
            await conn.tables.user.createTables(conn);
          }),
      Migrations(
          id: 2,
          up: (db) async {
            await db.tables.email.createTables(db);
          }),
      // dummy migration to indicate a required clean database ;)
      Migrations(id: 3, up: (db) async {}),
      Migrations(id: 4, up: (db) async => await db.tables.email.migrate4(db)),
      Migrations(id: 5, up: (db) async => await db.tables.email.migrate5(db)),
    ];
  }
}

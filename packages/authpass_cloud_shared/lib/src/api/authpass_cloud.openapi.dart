// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_initializing_formals

import 'package:json_annotation/json_annotation.dart' as _i1;
import 'package:meta/meta.dart' as _i2;
import 'package:openapi_base/openapi_base.dart' as _i3;
part 'authpass_cloud.openapi.g.dart';

///
@_i1.JsonSerializable()
class RegisterRequest {
  RegisterRequest({@_i2.required this.email});

  factory RegisterRequest.fromJson(Map<String, dynamic> jsonMap) =>
      _$RegisterRequestFromJson(jsonMap);

  /// Email address for the current user.
  @_i1.JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
  @override
  String toString() => toJson().toString();
}

enum RegisterResponseStatus {
  @_i1.JsonValue('created')
  created,
  @_i1.JsonValue('confirmed')
  confirmed,
}

extension RegisterResponseStatusExt on RegisterResponseStatus {
  static final Map<String, RegisterResponseStatus> _names = {
    'created': RegisterResponseStatus.created,
    'confirmed': RegisterResponseStatus.confirmed
  };
  static RegisterResponseStatus fromName(String name) => _names[name];
  String get name => toString().substring(23);
}

///
@_i1.JsonSerializable()
class RegisterResponse {
  RegisterResponse(
      {@_i2.required this.userUuid,
      @_i2.required this.authToken,
      @_i2.required this.status});

  factory RegisterResponse.fromJson(Map<String, dynamic> jsonMap) =>
      _$RegisterResponseFromJson(jsonMap);

  /// Uuid of the newly registered user.
  @_i1.JsonKey(name: 'userUuid')
  final String userUuid;

  /// Auth token which can be used for authentication, once email is confirmed.
  @_i1.JsonKey(name: 'authToken')
  final String authToken;

  /// Status of the user and auth token (created or confirmed).
  @_i1.JsonKey(name: 'status')
  final RegisterResponseStatus status;

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
  @override
  String toString() => toJson().toString();
}

class _UserRegisterPostResponse200 extends UserRegisterPostResponse
    implements _i3.OpenApiResponseBodyJson {
  /// OK
  _UserRegisterPostResponse200.response200(this.body)
      : status = 200,
        bodyJson = body.toJson();

  @override
  final int status;

  final RegisterResponse body;

  @override
  final Map<String, dynamic> bodyJson;

  @override
  final _i3.OpenApiContentType contentType =
      _i3.OpenApiContentType.parse('application/json');

  @override
  Map<String, Object> propertiesToString() => {
        'status': status,
        'body': body,
        'bodyJson': bodyJson,
        'contentType': contentType
      };
}

abstract class UserRegisterPostResponse extends _i3.OpenApiResponse {
  UserRegisterPostResponse();

  /// OK
  factory UserRegisterPostResponse.response200(RegisterResponse body) =>
      _UserRegisterPostResponse200.response200(body);

  void map(
      {@_i2.required _i3.ResponseMap<_UserRegisterPostResponse200> on200}) {
    if (this is _UserRegisterPostResponse200) {
      on200((this as _UserRegisterPostResponse200));
    } else {
      throw StateError('Invalid instance type $this');
    }
  }
}

class _EmailConfirmGetResponse200 extends EmailConfirmGetResponse
    implements _i3.OpenApiResponseBodyString {
  /// OK
  _EmailConfirmGetResponse200.response200(this.body) : status = 200;

  @override
  final int status;

  final String body;

  @override
  final _i3.OpenApiContentType contentType =
      _i3.OpenApiContentType.parse('text/html');

  @override
  Map<String, Object> propertiesToString() =>
      {'status': status, 'body': body, 'contentType': contentType};
}

class _EmailConfirmGetResponse400 extends EmailConfirmGetResponse {
  /// Invalid token or email address.
  _EmailConfirmGetResponse400.response400() : status = 400;

  @override
  final int status;

  @override
  final _i3.OpenApiContentType contentType = null;

  @override
  Map<String, Object> propertiesToString() =>
      {'status': status, 'contentType': contentType};
}

abstract class EmailConfirmGetResponse extends _i3.OpenApiResponse {
  EmailConfirmGetResponse();

  /// OK
  factory EmailConfirmGetResponse.response200(String body) =>
      _EmailConfirmGetResponse200.response200(body);

  /// Invalid token or email address.
  factory EmailConfirmGetResponse.response400() =>
      _EmailConfirmGetResponse400.response400();

  void map(
      {@_i2.required _i3.ResponseMap<_EmailConfirmGetResponse200> on200,
      @_i2.required _i3.ResponseMap<_EmailConfirmGetResponse400> on400}) {
    if (this is _EmailConfirmGetResponse200) {
      on200((this as _EmailConfirmGetResponse200));
    } else if (this is _EmailConfirmGetResponse400) {
      on400((this as _EmailConfirmGetResponse400));
    } else {
      throw StateError('Invalid instance type $this');
    }
  }
}

class _EmailConfirmPostResponse200 extends EmailConfirmPostResponse
    implements _i3.OpenApiResponseBodyString {
  /// OK
  _EmailConfirmPostResponse200.response200(this.body) : status = 200;

  @override
  final int status;

  final String body;

  @override
  final _i3.OpenApiContentType contentType =
      _i3.OpenApiContentType.parse('text/html');

  @override
  Map<String, Object> propertiesToString() =>
      {'status': status, 'body': body, 'contentType': contentType};
}

class _EmailConfirmPostResponse400 extends EmailConfirmPostResponse {
  /// Invalid token or email address.
  _EmailConfirmPostResponse400.response400() : status = 400;

  @override
  final int status;

  @override
  final _i3.OpenApiContentType contentType = null;

  @override
  Map<String, Object> propertiesToString() =>
      {'status': status, 'contentType': contentType};
}

abstract class EmailConfirmPostResponse extends _i3.OpenApiResponse {
  EmailConfirmPostResponse();

  /// OK
  factory EmailConfirmPostResponse.response200(String body) =>
      _EmailConfirmPostResponse200.response200(body);

  /// Invalid token or email address.
  factory EmailConfirmPostResponse.response400() =>
      _EmailConfirmPostResponse400.response400();

  void map(
      {@_i2.required _i3.ResponseMap<_EmailConfirmPostResponse200> on200,
      @_i2.required _i3.ResponseMap<_EmailConfirmPostResponse400> on400}) {
    if (this is _EmailConfirmPostResponse200) {
      on200((this as _EmailConfirmPostResponse200));
    } else if (this is _EmailConfirmPostResponse400) {
      on400((this as _EmailConfirmPostResponse400));
    } else {
      throw StateError('Invalid instance type $this');
    }
  }
}

///
@_i1.JsonSerializable()
class EmailConfirmSchema {
  EmailConfirmSchema({@_i2.required this.token, this.gRecaptchaResponse});

  factory EmailConfirmSchema.fromJson(Map<String, dynamic> jsonMap) =>
      _$EmailConfirmSchemaFromJson(jsonMap);

  /// null
  @_i1.JsonKey(name: 'token')
  final String token;

  /// null
  @_i1.JsonKey(name: 'g-recaptcha-response')
  final String gRecaptchaResponse;

  Map<String, dynamic> toJson() => _$EmailConfirmSchemaToJson(this);
  @override
  String toString() => toJson().toString();
}

abstract class AuthPassCloud implements _i3.ApiEndpoint {
  /// Create new user, or login the user using confirmation email.
  /// post: /user/register
  Future<UserRegisterPostResponse> userRegisterPost(RegisterRequest body);

  /// Confirm email address
  /// get: /email/confirm
  Future<EmailConfirmGetResponse> emailConfirmGet({@_i2.required String token});

  /// Confirm with recaptcha
  /// post: /email/confirm
  Future<EmailConfirmPostResponse> emailConfirmPost(EmailConfirmSchema body);
}

abstract class AuthPassCloudClient {
  factory AuthPassCloudClient(
          Uri baseUri, _i3.OpenApiRequestSender requestSender) =>
      _AuthPassCloudClientImpl._(baseUri, requestSender);

  /// Create new user, or login the user using confirmation email.
  /// post: /user/register
  ///
  Future<UserRegisterPostResponse> userRegisterPost(RegisterRequest body);

  /// Confirm email address
  /// get: /email/confirm
  ///
  /// * [token]: Unique token which was sent to email address.
  Future<EmailConfirmGetResponse> emailConfirmGet({@_i2.required String token});

  /// Confirm with recaptcha
  /// post: /email/confirm
  ///
  Future<EmailConfirmPostResponse> emailConfirmPost(EmailConfirmSchema body);
}

class _AuthPassCloudClientImpl extends _i3.OpenApiClientBase
    implements AuthPassCloudClient {
  _AuthPassCloudClientImpl._(this.baseUri, this.requestSender);

  @override
  final Uri baseUri;

  @override
  final _i3.OpenApiRequestSender requestSender;

  /// Create new user, or login the user using confirmation email.
  /// post: /user/register
  ///
  @override
  Future<UserRegisterPostResponse> userRegisterPost(
      RegisterRequest body) async {
    final request = _i3.OpenApiClientRequest('post', '/user/register');
    request.setJsonBody(body.toJson());
    return await sendRequest(request, {
      '200': (_i3.OpenApiClientResponse response) async =>
          _UserRegisterPostResponse200.response200(
              RegisterResponse.fromJson(await response.responseBodyJson()))
    });
  }

  /// Confirm email address
  /// get: /email/confirm
  ///
  /// * [token]: Unique token which was sent to email address.
  @override
  Future<EmailConfirmGetResponse> emailConfirmGet(
      {@_i2.required String token}) async {
    final request = _i3.OpenApiClientRequest('get', '/email/confirm');
    request.addQueryParameter('token', encodeString(token));
    return await sendRequest(request, {
      '200': (_i3.OpenApiClientResponse response) async =>
          _EmailConfirmGetResponse200.response200(
              await response.responseBodyString()),
      '400': (_i3.OpenApiClientResponse response) async =>
          _EmailConfirmGetResponse400.response400()
    });
  }

  /// Confirm with recaptcha
  /// post: /email/confirm
  ///
  @override
  Future<EmailConfirmPostResponse> emailConfirmPost(
      EmailConfirmSchema body) async {
    final request = _i3.OpenApiClientRequest('post', '/email/confirm');
    request.setJsonBody(body.toJson());
    return await sendRequest(request, {
      '200': (_i3.OpenApiClientResponse response) async =>
          _EmailConfirmPostResponse200.response200(
              await response.responseBodyString()),
      '400': (_i3.OpenApiClientResponse response) async =>
          _EmailConfirmPostResponse400.response400()
    });
  }
}

class AuthPassCloudUrlResolve with _i3.OpenApiUrlEncodeMixin {
  /// Create new user, or login the user using confirmation email.
  /// post: /user/register
  ///
  _i3.OpenApiClientRequest userRegisterPost() {
    final request = _i3.OpenApiClientRequest('post', '/user/register');
    return request;
  }

  /// Confirm email address
  /// get: /email/confirm
  ///
  /// * [token]: Unique token which was sent to email address.
  _i3.OpenApiClientRequest emailConfirmGet({@_i2.required String token}) {
    final request = _i3.OpenApiClientRequest('get', '/email/confirm');
    request.addQueryParameter('token', encodeString(token));
    return request;
  }

  /// Confirm with recaptcha
  /// post: /email/confirm
  ///
  _i3.OpenApiClientRequest emailConfirmPost() {
    final request = _i3.OpenApiClientRequest('post', '/email/confirm');
    return request;
  }
}

class AuthPassCloudRouter extends _i3.OpenApiServerRouterBase {
  AuthPassCloudRouter(this.impl);

  final _i3.ApiEndpointProvider<AuthPassCloud> impl;

  @override
  void configure() {
    addRoute('/user/register', 'post', (_i3.OpenApiRequest request) async {
      return await impl.invoke((AuthPassCloud impl) async =>
          impl.userRegisterPost(
              RegisterRequest.fromJson(await request.readJsonBody())));
    }, security: [
      _i3.SecurityRequirement(schemes: [
        _i3.SecurityRequirementScheme(
            scheme: SecuritySchemes.authToken, scopes: [])
      ])
    ]);
    addRoute('/email/confirm', 'get', (_i3.OpenApiRequest request) async {
      return await impl.invoke((AuthPassCloud impl) async =>
          impl.emailConfirmGet(
              token: paramToString(request.queryParameter('token'))));
    }, security: [
      _i3.SecurityRequirement(schemes: [
        _i3.SecurityRequirementScheme(
            scheme: SecuritySchemes.authToken, scopes: [])
      ])
    ]);
    addRoute('/email/confirm', 'post', (_i3.OpenApiRequest request) async {
      return await impl.invoke((AuthPassCloud impl) async =>
          impl.emailConfirmPost(EmailConfirmSchema.fromJson(
              await request.readUrlEncodedBodyFlat())));
    }, security: [
      _i3.SecurityRequirement(schemes: [
        _i3.SecurityRequirementScheme(
            scheme: SecuritySchemes.authToken, scopes: [])
      ])
    ]);
  }
}

class SecuritySchemes {
  static final authToken =
      _i3.SecuritySchemeHttp(scheme: _i3.SecuritySchemeHttpScheme.bearer);
}

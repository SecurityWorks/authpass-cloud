// Mocks generated by Mockito 5.2.0 from annotations
// in authpass_cloud_backend/test/endpoint/endpoint_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:authpass_cloud_backend/src/service/email_service.dart' as _i5;
import 'package:authpass_cloud_backend/src/service/recaptcha_service.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:openapi_base/openapi_base.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [OpenApiRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockOpenApiRequest extends _i1.Mock implements _i2.OpenApiRequest {
  MockOpenApiRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> headerParameter(String? name) =>
      (super.noSuchMethod(Invocation.method(#headerParameter, [name]),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> cookieParameter(String? name) =>
      (super.noSuchMethod(Invocation.method(#cookieParameter, [name]),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> pathParameter(String? name) =>
      (super.noSuchMethod(Invocation.method(#pathParameter, [name]),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> queryParameter(String? name) =>
      (super.noSuchMethod(Invocation.method(#queryParameter, [name]),
          returnValue: <String>[]) as List<String>);
  @override
  _i3.Future<Map<String, dynamic>> readJsonBody() => (super.noSuchMethod(
          Invocation.method(#readJsonBody, []),
          returnValue: Future<Map<String, dynamic>>.value(<String, dynamic>{}))
      as _i3.Future<Map<String, dynamic>>);
  @override
  _i3.Future<Map<String, List<String>>> readUrlEncodedBody() =>
      (super.noSuchMethod(Invocation.method(#readUrlEncodedBody, []),
              returnValue: Future<Map<String, List<String>>>.value(
                  <String, List<String>>{}))
          as _i3.Future<Map<String, List<String>>>);
  @override
  _i3.Future<Map<String, String>> readUrlEncodedBodyFlat() =>
      (super.noSuchMethod(Invocation.method(#readUrlEncodedBodyFlat, []),
              returnValue:
                  Future<Map<String, String>>.value(<String, String>{}))
          as _i3.Future<Map<String, String>>);
  @override
  _i3.Future<String> readBodyString() =>
      (super.noSuchMethod(Invocation.method(#readBodyString, []),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
  @override
  _i3.Future<_i4.Uint8List> readBodyBytes() =>
      (super.noSuchMethod(Invocation.method(#readBodyBytes, []),
              returnValue: Future<_i4.Uint8List>.value(_i4.Uint8List(0)))
          as _i3.Future<_i4.Uint8List>);
}

/// A class which mocks [EmailService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmailService extends _i1.Mock implements _i5.EmailService {
  MockEmailService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> sendEmailConfirmationToken(String? recipient, String? url) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailConfirmationToken, [recipient, url]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> forwardMimeMessage(
          String? mimeMessageContent, String? recipientEmail) =>
      (super.noSuchMethod(
          Invocation.method(
              #forwardMimeMessage, [mimeMessageContent, recipientEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}

/// A class which mocks [RecaptchaService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecaptchaService extends _i1.Mock implements _i6.RecaptchaService {
  MockRecaptchaService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get secret =>
      (super.noSuchMethod(Invocation.getter(#secret), returnValue: '')
          as String);
  @override
  _i3.Future<bool> verify(String? response, [String? remoteIp]) =>
      (super.noSuchMethod(Invocation.method(#verify, [response, remoteIp]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}

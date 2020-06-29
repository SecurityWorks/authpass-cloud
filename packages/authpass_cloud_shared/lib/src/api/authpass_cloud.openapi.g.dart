// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authpass_cloud.openapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return RegisterRequest(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    userUuid: json['userUuid'] as String,
    authToken: json['authToken'] as String,
    status:
        _$enumDecodeNullable(_$RegisterResponseStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'userUuid': instance.userUuid,
      'authToken': instance.authToken,
      'status': _$RegisterResponseStatusEnumMap[instance.status],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RegisterResponseStatusEnumMap = {
  RegisterResponseStatus.created: 'created',
  RegisterResponseStatus.confirmed: 'confirmed',
};

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    nextPageToken: json['nextPageToken'] as String,
    sinceToken: json['sinceToken'] as String,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'nextPageToken': instance.nextPageToken,
      'sinceToken': instance.sinceToken,
    };

EmailMessage _$EmailMessageFromJson(Map<String, dynamic> json) {
  return EmailMessage(
    id: json['id'] as String,
    subject: json['subject'] as String,
    sender: json['sender'] as String,
    mailboxEntryUuid: json['mailboxEntryUuid'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    size: json['size'] as int,
    isRead: json['isRead'] as bool,
  );
}

Map<String, dynamic> _$EmailMessageToJson(EmailMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'sender': instance.sender,
      'mailboxEntryUuid': instance.mailboxEntryUuid,
      'createdAt': instance.createdAt?.toIso8601String(),
      'size': instance.size,
      'isRead': instance.isRead,
    };

EmailStatusGetResponseBody200 _$EmailStatusGetResponseBody200FromJson(
    Map<String, dynamic> json) {
  return EmailStatusGetResponseBody200(
    status: _$enumDecodeNullable(
        _$EmailStatusGetResponseBody200StatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$EmailStatusGetResponseBody200ToJson(
        EmailStatusGetResponseBody200 instance) =>
    <String, dynamic>{
      'status': _$EmailStatusGetResponseBody200StatusEnumMap[instance.status],
    };

const _$EmailStatusGetResponseBody200StatusEnumMap = {
  EmailStatusGetResponseBody200Status.created: 'created',
  EmailStatusGetResponseBody200Status.confirmed: 'confirmed',
};

EmailConfirmSchema _$EmailConfirmSchemaFromJson(Map<String, dynamic> json) {
  return EmailConfirmSchema(
    token: json['token'] as String,
    gRecaptchaResponse: json['g-recaptcha-response'] as String,
  );
}

Map<String, dynamic> _$EmailConfirmSchemaToJson(EmailConfirmSchema instance) =>
    <String, dynamic>{
      'token': instance.token,
      'g-recaptcha-response': instance.gRecaptchaResponse,
    };

MailboxCreatePostResponseBody200 _$MailboxCreatePostResponseBody200FromJson(
    Map<String, dynamic> json) {
  return MailboxCreatePostResponseBody200(
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$MailboxCreatePostResponseBody200ToJson(
        MailboxCreatePostResponseBody200 instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

MailboxCreateSchema _$MailboxCreateSchemaFromJson(Map<String, dynamic> json) {
  return MailboxCreateSchema(
    label: json['label'] as String,
    entryUuid: json['entryUuid'] as String,
  );
}

Map<String, dynamic> _$MailboxCreateSchemaToJson(
        MailboxCreateSchema instance) =>
    <String, dynamic>{
      'label': instance.label,
      'entryUuid': instance.entryUuid,
    };

MailboxListGetResponseBody200 _$MailboxListGetResponseBody200FromJson(
    Map<String, dynamic> json) {
  return MailboxListGetResponseBody200(
    page: json['page'] == null
        ? null
        : Page.fromJson(json['page'] as Map<String, dynamic>),
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : EmailMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MailboxListGetResponseBody200ToJson(
        MailboxListGetResponseBody200 instance) =>
    <String, dynamic>{
      'page': instance.page,
      'data': instance.data,
    };

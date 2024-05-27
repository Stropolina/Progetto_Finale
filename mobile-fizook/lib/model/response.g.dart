// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response<T> _$ResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Response<T>()
      ..code = (json['code'] as num?)?.toInt()
      ..hasError = json['hasError'] as bool
      ..message = json['message'] as String?
      ..result = fromJsonT(json['result']);

Map<String, dynamic> _$ResponseToJson<T>(
  Response<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'hasError': instance.hasError,
      'message': instance.message,
      'result': toJsonT(instance.result),
    };

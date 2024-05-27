// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingParameters _$BookingParametersFromJson(Map<String, dynamic> json) =>
    BookingParameters()
      ..classroom = json['class'] as String
      ..start = json['start'] as String
      ..end = json['end'] as String
      ..userType = json['userType'] as String;

Map<String, dynamic> _$BookingParametersToJson(BookingParameters instance) =>
    <String, dynamic>{
      'class': instance.classroom,
      'start': instance.start,
      'end': instance.end,
      'userType': instance.userType,
    };

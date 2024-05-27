// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingView _$BookingViewFromJson(Map<String, dynamic> json) => BookingView()
  ..id = json['Id'] as String?
  ..bookingId = json['BookingId'] as String?
  ..userId = json['UserId'] as String?
  ..activity = json['Activity'] as String?
  ..classroom = json['Class'] as String?
  ..room = json['Room'] as String?
  ..subject = json['Subject'] as String?
  ..start = json['Start'] as String
  ..end = json['End'] as String;

Map<String, dynamic> _$BookingViewToJson(BookingView instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'BookingId': instance.bookingId,
      'UserId': instance.userId,
      'Activity': instance.activity,
      'Class': instance.classroom,
      'Room': instance.room,
      'Subject': instance.subject,
      'Start': instance.start,
      'End': instance.end,
    };

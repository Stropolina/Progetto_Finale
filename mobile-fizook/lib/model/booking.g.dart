// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking()
  ..id = (json['id'] as num).toInt()
  ..parentId = (json['parentId'] as num).toInt()
  ..activityId = (json['activity'] as num).toInt()
  ..classroomId = (json['class'] as num).toInt()
  ..roomId = (json['room'] as num).toInt()
  ..subjectId = (json['subject'] as num).toInt()
  ..start = json['start'] as String
  ..end = json['end'] as String;

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'activity': instance.activityId,
      'class': instance.classroomId,
      'room': instance.roomId,
      'subject': instance.subjectId,
      'start': instance.start,
      'end': instance.end,
    };

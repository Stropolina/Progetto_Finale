// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimetableItem _$TimetableItemFromJson(Map<String, dynamic> json) =>
    TimetableItem()
      ..activity = json['Activity'] as String?
      ..classroom = json['Class'] as String?
      ..room = json['Room'] as String?
      ..subject = json['Subject'] as String?
      ..start = json['Start'] as String
      ..end = json['End'] as String;

Map<String, dynamic> _$TimetableItemToJson(TimetableItem instance) =>
    <String, dynamic>{
      'Activity': instance.activity,
      'Class': instance.classroom,
      'Room': instance.room,
      'Subject': instance.subject,
      'Start': instance.start,
      'End': instance.end,
    };

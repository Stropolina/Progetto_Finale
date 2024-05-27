// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room()
  ..id = json['Id'] as String
  ..name = json['Name'] as String
  ..code = json['Code'] as String
  ..building = json['Building'] as String
  ..floor = json['Floor'] as String;

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Code': instance.code,
      'Building': instance.building,
      'Floor': instance.floor,
    };

import 'package:json_annotation/json_annotation.dart';

part 'timetable_item.g.dart';

@JsonSerializable()
class TimetableItem {
  // #region Fields & Properties
  @JsonKey(name: 'Activity')
  late String? activity;

  @JsonKey(name: 'Class')
  late String? classroom;

  @JsonKey(name: 'Room')
  late String? room;

  @JsonKey(name: 'Subject')
  late String? subject;

  @JsonKey(name: 'Start')
  late String start;

  @JsonKey(name: 'End')
  late String end;
  // #endregion

  // #region Constructors
  TimetableItem();
// #endregion

// #region Methods
  factory TimetableItem.fromJson(Object? json) => _$TimetableItemFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$TimetableItemToJson(this);
// #endregion
}
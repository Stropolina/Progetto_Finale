import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  // #region Fields & Properties
  @JsonKey(name: 'id')
  late int id = 0;

  @JsonKey(name: 'parentId')
  late int parentId = 0;

  @JsonKey(name: 'activity')
  late int activityId = 0;

  @JsonKey(name: 'class')
  late int classroomId = 0;

  @JsonKey(name: 'room')
  late int roomId = 0;

  @JsonKey(name: 'subject')
  late int subjectId = 0;

  @JsonKey(name: 'start')
  late String start;

  @JsonKey(name: 'end')
  late String end;
  // #endregion

  // #region Constructors
  Booking();
// #endregion

// #region Methods
  factory Booking.fromJson(Object? json) => _$BookingFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
// #endregion
}
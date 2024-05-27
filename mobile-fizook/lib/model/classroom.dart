import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class ClassRoom {
  // #region Fields & Properties
  @JsonKey(name: 'Class')
  late String name;
  // #endregion

  // #region Constructors
  ClassRoom();
// #endregion

// #region Methods
  factory ClassRoom.fromJson(Object? json) => _$ClassRoomFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);
// #endregion
}
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;

  @JsonKey(name: 'Code')
  late String code;
  
  @JsonKey(name: 'Building')
  late String building;

  @JsonKey(name: 'Floor')
  late String floor;
  // #endregion

  // #region Constructors
  Room();
// #endregion

// #region Methods
  factory Room.fromJson(Object? json) => _$RoomFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
// #endregion
} 
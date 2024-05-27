import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;
  // #endregion

  // #region Constructors
  Activity();
// #endregion

// #region Methods
  factory Activity.fromJson(Object? json) => _$ActivityFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
// #endregion
} 
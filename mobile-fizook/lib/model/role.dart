import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;
  // #endregion

  // #region Constructors
  Role();
// #endregion

// #region Methods
  factory Role.fromJson(Object? json) => _$RoleFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
// #endregion
}
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;
  // #endregion

  // #region Constructors
  Permission();
// #endregion

// #region Methods
  factory Permission.fromJson(Object? json) => _$PermissionFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
// #endregion
}

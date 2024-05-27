import 'package:json_annotation/json_annotation.dart';

part 'fizook_user.g.dart';

@JsonSerializable()
class FiZooKUser {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'FirstName')
  late String firstName;

  @JsonKey(name: 'LastName')
  late String lastName;

  @JsonKey(name: 'Email')
  late String email;

  @JsonKey(name: 'UserType')
  late String userType;

  @JsonKey(name: 'Photo')
  late String? photo;

  @JsonKey(name: 'RoleId')
  late String roleId;
  // #endregion

  // #region Constructors
  FiZooKUser();
// #endregion

// #region Methods
  factory FiZooKUser.fromJson(Object? json) => _$FiZooKUserFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$FiZooKUserToJson(this);
// #endregion
}

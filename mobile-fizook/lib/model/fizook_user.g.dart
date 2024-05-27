// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fizook_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiZooKUser _$FiZooKUserFromJson(Map<String, dynamic> json) => FiZooKUser()
  ..id = json['Id'] as String
  ..firstName = json['FirstName'] as String
  ..lastName = json['LastName'] as String
  ..email = json['Email'] as String
  ..userType = json['UserType'] as String
  ..photo = json['Photo'] as String?
  ..roleId = json['RoleId'] as String;

Map<String, dynamic> _$FiZooKUserToJson(FiZooKUser instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'UserType': instance.userType,
      'Photo': instance.photo,
      'RoleId': instance.roleId,
    };

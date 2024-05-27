// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bag_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthBagProvider _$AuthBagProviderFromJson(Map<String, dynamic> json) =>
    AuthBagProvider()
      ..user = FiZooKUser.fromJson(json['user'])
      ..oauthUid = json['oauthUid'] as String
      ..role = Role.fromJson(json['role'])
      ..permissions = (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
      ..isAuthenticated = json['isAuthenticated'] as bool
      ..classes =
          (json['classes'] as List<dynamic>).map(ClassRoom.fromJson).toList();

Map<String, dynamic> _$AuthBagProviderToJson(AuthBagProvider instance) =>
    <String, dynamic>{
      'user': instance.user,
      'oauthUid': instance.oauthUid,
      'role': instance.role,
      'permissions': instance.permissions,
      'isAuthenticated': instance.isAuthenticated,
      'classes': instance.classes,
    };

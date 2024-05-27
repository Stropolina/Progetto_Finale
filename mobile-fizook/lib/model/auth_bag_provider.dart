import 'package:fizook/model/classroom.dart';
import 'package:fizook/model/fizook_user.dart';
import 'package:fizook/model/permission.dart';
import 'package:fizook/model/role.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_bag_provider.g.dart';

@JsonSerializable()
class AuthBagProvider extends ChangeNotifier {
  // #region Fields & Properties
  late FiZooKUser _user;
  FiZooKUser get user => _user;
  set user(FiZooKUser newUser) {
    _user = newUser;
    notifyListeners();
  }

  late String _oauthUid;
  String get oauthUid => _oauthUid;
  set oauthUid(String newOauthUid) {
    _oauthUid = newOauthUid;
    notifyListeners();
  }

  late Role _role;
  Role get role => _role;
  set role(Role newRole) {
    _role = newRole;
    notifyListeners();
  }

  late List<String> _permissions;
  List<String> get permissions => _permissions;
  set permissions(List<String> newPermissions) {
    _permissions = newPermissions;
    notifyListeners();
  }

  late bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool newIsAuthenticated) {
    _isAuthenticated = newIsAuthenticated;
    notifyListeners();
  }

  late List<ClassRoom> _classes;
  List<ClassRoom> get classes => _classes;
  set classes(List<ClassRoom> newClasses) {
    _classes = newClasses;
    notifyListeners();
  }

  // #endregion

// #region Constructors
  AuthBagProvider();
// #endregion

// #region Methods
  factory AuthBagProvider.fromJson(Object? json) => _$AuthBagProviderFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AuthBagProviderToJson(this);
// #endregion
}

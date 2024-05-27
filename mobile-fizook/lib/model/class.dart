import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

@JsonSerializable()
class Class {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;
  // #endregion

  // #region Constructors
  Class();
// #endregion

// #region Methods
  factory Class.fromJson(Object? json) => _$ClassFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ClassToJson(this);
// #endregion
} 
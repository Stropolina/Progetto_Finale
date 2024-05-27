import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String id;

  @JsonKey(name: 'Name')
  late String name;
  // #endregion

  // #region Constructors
  Subject();
// #endregion

// #region Methods
  factory Subject.fromJson(Object? json) => _$SubjectFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
// #endregion
} 
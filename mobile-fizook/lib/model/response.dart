import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Response<T> {
  // #region Fields & Properties
  late int? code;
  late bool hasError;
  late String? message;
  late T result;
  // #endregion

  // #region Constructors
  Response();
  // #endregion

// #region Methods
  factory Response.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ResponseToJson(this, toJsonT);
// #endregion
}
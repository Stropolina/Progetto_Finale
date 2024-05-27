import 'package:json_annotation/json_annotation.dart';

part 'booking_parameters.g.dart';

@JsonSerializable()
class BookingParameters {
  // #region Fields & Properties
  @JsonKey(name: "class")
  late String classroom;

  late String start;

  late String end;

  late String userType;
  // #endregion

  // #region Constructors
  BookingParameters();
// #endregion

// #region Methods
  factory BookingParameters.fromJson(Object? json) => _$BookingParametersFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BookingParametersToJson(this);
// #endregion
}
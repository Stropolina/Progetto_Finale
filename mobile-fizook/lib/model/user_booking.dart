import 'package:fizook/model/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_booking.g.dart';

@JsonSerializable()
class UserBooking {
  // #region Fields & Properties
  @JsonKey(name: 'booking')
  late Booking booking = Booking();

  @JsonKey(name: 'userId')
  late int userId = 0;

  @JsonKey(name: 'id')
  late int id = 0;
  // #endregion

  // #region Constructors
  UserBooking();
// #endregion

// #region Methods
  factory UserBooking.fromJson(Object? json) => _$UserBookingFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserBookingToJson(this);
// #endregion
}
import 'package:json_annotation/json_annotation.dart';

part 'booking_view.g.dart';

@JsonSerializable()
class BookingView {
  // #region Fields & Properties
  @JsonKey(name: 'Id')
  late String? id;

  @JsonKey(name: 'BookingId')
  late String? bookingId;

  @JsonKey(name: 'UserId')
  late String? userId;

  @JsonKey(name: 'Activity')
  late String? activity;

  @JsonKey(name: 'Class')
  late String? classroom;

  @JsonKey(name: 'Room')
  late String? room;

  @JsonKey(name: 'Subject')
  late String? subject;

  @JsonKey(name: 'Start')
  late String start;

  @JsonKey(name: 'End')
  late String end;
  // #endregion

  // #region Constructors
  BookingView();
// #endregion

// #region Methods
  factory BookingView.fromJson(Object? json) => _$BookingViewFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$BookingViewToJson(this);
// #endregion
}
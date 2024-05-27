// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBooking _$UserBookingFromJson(Map<String, dynamic> json) => UserBooking()
  ..booking = Booking.fromJson(json['booking'])
  ..userId = (json['userId'] as num).toInt()
  ..id = (json['id'] as num).toInt();

Map<String, dynamic> _$UserBookingToJson(UserBooking instance) =>
    <String, dynamic>{
      'booking': instance.booking,
      'userId': instance.userId,
      'id': instance.id,
    };

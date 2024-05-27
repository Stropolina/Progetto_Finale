import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/booking_view.dart';
import 'package:fizook/model/timetable_item.dart';

import '../model/response.dart';
import 'common.dart';

class BookingService {
  RestClient client = RestClient(baseUrl);

  bookingView (bookingParameters) async {
    Response<List<TimetableItem>> response = await client.post<Response<List<TimetableItem>>>("/timetables", bookingParameters, (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<TimetableItem>((item) => TimetableItem.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }

  getMyBookings (userId) async {
    Response<List<BookingView>> response = await client.get<Response<List<BookingView>>>("/bookings/users/$userId", (json) => Response.fromJson(json, (json) => (json as List<dynamic>).map<BookingView>((item) => BookingView.fromJson(item as Map<String, dynamic>)).toList()));

    return response;
  }

  addBooking (userBooking) async {
    Response<bool> response = await client.post<Response<bool>>("/bookings/users", userBooking, (json) => Response.fromJson(json, (json) => json as bool));

    return response;
  }

  deleteBooking (bookingId) async {
    Response<bool> response = await client.delete<Response<bool>>("/bookings/users/$bookingId", (json) => Response.fromJson(json, (json) => json as bool));

    return response;
  }
}
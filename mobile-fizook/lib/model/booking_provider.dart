import 'package:flutter/material.dart';

import 'booking.dart';
import 'class.dart';
import 'subject.dart';
import 'room.dart';
import 'activity.dart';
import 'booking_view.dart';


class BookingProvider extends ChangeNotifier {
  // #region Fields & Properties
  late BookingView _currentBooking = BookingView();
  BookingView get currentBooking => _currentBooking;
  set currentBooking(BookingView newCurrentBooking) {
    _currentBooking = newCurrentBooking;
    notifyListeners();
  }

  late Duration _startTime = Duration(hours: TimeOfDay.now().hour, minutes: TimeOfDay.now().minute);
  Duration get startTime => _startTime;
  set startTime(Duration newStartTime) {
    _startTime = newStartTime;
    notifyListeners();
  }

  late Duration _endTime = Duration(hours: TimeOfDay.now().hour, minutes: TimeOfDay.now().minute);
  Duration get endTime => _endTime;
  set endTime(Duration newEndTime) {
    _endTime = newEndTime;
    notifyListeners();
  }

  late DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime newSelectedDate) {
    _selectedDate = newSelectedDate;
    notifyListeners();
  }

  late List<BookingView> _bookings = List.empty();
  List<BookingView>  get bookings => _bookings;
  set bookings(List<BookingView>  newBookings) {
    _bookings = newBookings;
    notifyListeners();
  }

  late List<Class> _classes = List.empty();
  List<Class>  get classes => _classes;
  set classes(List<Class>  newClasses) {
    _classes = newClasses;
    notifyListeners();
  }

  late List<Subject> _subjects = List.empty();
  List<Subject>  get subjects => _subjects;
  set subjects(List<Subject>  newSubjects) {
    _subjects = newSubjects;
    notifyListeners();
  }

  late List<Room> _rooms = List.empty();
  List<Room>  get rooms => _rooms;
  set rooms(List<Room>  newRooms) {
    _rooms = newRooms;
    notifyListeners();
  }

  late List<Activity> _activities = List.empty();
  List<Activity>  get activities => _activities;
  set activities(List<Activity>  newActivities) {
    _activities = newActivities;
    notifyListeners();
  }

  late Booking _booking = Booking();
  Booking get booking => _booking;
  set booking(Booking newBooking) {
    _booking = newBooking;
    notifyListeners();
  }

  // #endregion
}

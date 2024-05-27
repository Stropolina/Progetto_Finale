import 'package:fizook/model/timetable_item.dart';
import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  // #region Fields & Properties
  late int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int newCurrentIndex) {
    _currentIndex = newCurrentIndex;
    notifyListeners();
  }

  late DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  set currentDate(DateTime newCurrentDate) {
    _currentDate = newCurrentDate;
    notifyListeners();
  }

  late List<TimetableItem> _timetable = List.empty();
  List<TimetableItem>  get timetable => _timetable;
  set timetable(List<TimetableItem>  newTimetable) {
    _timetable = newTimetable;
    notifyListeners();
  }

  // #endregion
}

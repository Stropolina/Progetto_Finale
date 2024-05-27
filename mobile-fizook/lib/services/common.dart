import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:intl/date_symbol_data_local.dart';

//ipconfig getifaddr en0 <- comando per trovare l'ip del wifi, da sostituire a localhost
String baseUrl = "http://172.20.10.2/P002_FiZook/services";



String getTime(String date) {
  final segments = date.split(' ');
  return segments[1].substring(0, 5);
}

String getLongDate(DateTime date, String format) {
  initializeDateFormatting('it_IT');
  final DateFormat formatter = DateFormat(format, 'it_IT');
  final String formatted = formatter.format(date);
  return formatted;
}

String getDurationString(Duration duration) {
  return "${duration.inHours}:${duration.inMinutes.remainder(60)}"; 
}

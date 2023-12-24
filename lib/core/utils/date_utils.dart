// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/utils
// *******************************

import 'package:intl/intl.dart';

extension DateUtilsEx on DateTime{

  String get goalDateFormat{
    return DateFormat("dd MMMM, yyyy").format(this);
  }

}

int getRemainingMonths(DateTime date1, DateTime date2) {
  var months = 0;
  while (date1.year < date2.year || date1.month < date2.month) {
    months++;
    date1 = DateTime(date1.year, date1.month + 1, date1.day);
  }
  return months;
}

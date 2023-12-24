// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/utils
// *******************************

import 'package:intl/intl.dart';

extension CurrencyFormatEx on double{

  String get convertUsFormat{
    return "\$${NumberFormat.currency(locale: "en_US",symbol: "").format(double.parse(toStringAsFixed(0))).split(".").first}";
  }

}
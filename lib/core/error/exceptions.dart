// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/error
// *******************************

import 'package:budget_tracking/core/app_export.dart';

class ServerException implements Exception {

  late String _message;

  ServerException([String? message]) {
    _message = message??errSomethingWentWrong;
  }

  @override
  String toString() {
    return _message;
  }

}

class FireException implements Exception {

  late String _message;

  FireException([String? message]) {
    _message = message??errSomethingWentWrong;
  }

  @override
  String toString() {
    return _message;
  }

}


class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
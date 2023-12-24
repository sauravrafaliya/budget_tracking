// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/network
// *******************************

import 'package:connectivity_plus/connectivity_plus.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity);

  ///checks internet is connected or not
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

}

// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/utils
// *******************************

import 'package:budget_tracking/domain/firebase_firestore/user/firestore_user_helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../domain/firebase_auth/firebase_google_auth.dart';
import '../network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(FirestoreUserCollectionHelper());
    Get.put(FirebaseGoogleAuthHelper());
  }
}
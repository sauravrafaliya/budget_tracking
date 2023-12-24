// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/sign_in_up_screen/binding
// *******************************

import 'package:budget_tracking/presentation/sign_in_up_screen/controller/sign_in_up_controller.dart';

import 'package:get/get.dart';

class SignInUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInUpController());
  }
}
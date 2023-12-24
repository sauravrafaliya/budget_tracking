// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/utils
// *******************************

import 'package:get/get.dart';

class HelperFun{

  static buildSnackBar(String message){
    if(message.isEmpty)return;
    Get.rawSnackbar(
      message: message,
    );
  }

}
// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/sign_in_up_screen/controller
// *******************************

import 'package:budget_tracking/core/app_export.dart';
import 'package:budget_tracking/core/utils/helper_fun.dart';
import 'package:get/get.dart';

import '../../../domain/firebase_auth/firebase_google_auth.dart';
import '../../../domain/firebase_firestore/user/firestore_user_helper.dart';
import '../../../routes/app_routes.dart';

class SignInUpController extends GetxController{

  final isLoading  = false.obs;

  set updateIsLoading(bool status){
    isLoading.value = status;
    isLoading.refresh();
  }

  Future<void> signInUp()async{
    if(isLoading.value)return;
    try{
      updateIsLoading = true;
      await Get.find<FirebaseGoogleAuthHelper>().signInWithGoogle();
      await Get.find<FirestoreUserCollectionHelper>().setSampleGoalData();
      Get.offAndToNamed(AppRoutes.financialGoalScreen);
      updateIsLoading = true;
    } catch (error) {
      updateIsLoading = true;
      if(error is FireException){
        HelperFun.buildSnackBar(error.toString());
      }else{
        HelperFun.buildSnackBar(errSomethingWentWrong);
      }
    }
  }

}
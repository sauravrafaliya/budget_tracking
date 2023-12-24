// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/sign_in_screen
// *******************************

import 'package:budget_tracking/core/utils/assets_path.dart';
import 'package:budget_tracking/presentation/sign_in_up_screen/controller/sign_in_up_controller.dart';
import 'package:budget_tracking/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/const/const_string.dart';
import '../../theme/custom_text_style.dart';

class SignInUpScreen extends GetWidget<SignInUpController> {

  const SignInUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text(authentication,style: CustomTextStyle.white25_600.copyWith(color: AppTheme.primaryColor),),
              const Spacer(),
              SvgPicture.asset(
                  AssetsPath.astImgBudgetVectorSvg,
                width: context.width*0.7,
                height: context.width*0.7,
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: context.width,
                child: Obx(()=>ElevatedButton(
                  onPressed: ()async{
                    await controller.signInUp();
                  },
                  child: !controller.isLoading.value ? const Text(continueWithGoogle) : const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(strokeWidth: 2,),
                  ),
                )),
              ),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(authenticationText,
                  style: CustomTextStyle.primary12_400,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

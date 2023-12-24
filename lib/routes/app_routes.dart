// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/routes
// *******************************


import 'package:budget_tracking/presentation/financial_goal_detail/financial_goal_detail_screen.dart';
import 'package:budget_tracking/presentation/sign_in_up_screen/binding/sign_in_up_binding.dart';
import 'package:budget_tracking/presentation/sign_in_up_screen/sign_in_up_screen.dart';
import 'package:get/get.dart';

import '../presentation/financial_goal_detail/binding/financial_goal_detail_binding.dart';

class AppRoutes{

  static String signInUpScreen = '/sign_in_up_Screen';
  static String financialGoalScreen = '/financial_goal_screen';

  static List<GetPage> pages = [
    GetPage(
      name: signInUpScreen,
      page: () => const SignInUpScreen(),
      binding: SignInUpBinding()
    ),
    GetPage(
      name: financialGoalScreen,
      page: () => const FinancialGoalScreen(),
      binding: FinancialGoalBinding()
    )
  ];

}
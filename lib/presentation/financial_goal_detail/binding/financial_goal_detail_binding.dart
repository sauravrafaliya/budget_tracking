// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/financial_goal_detail/binding
// *******************************


import 'package:budget_tracking/presentation/financial_goal_detail/controller/financial_goal_detail_controller.dart';
import 'package:get/get.dart';

class FinancialGoalBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FinancialGoalDetailController());
  }

}
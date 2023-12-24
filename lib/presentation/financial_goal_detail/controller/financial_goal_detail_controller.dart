// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/financial_goal_detail/controller
// *******************************

import 'package:budget_tracking/core/app_export.dart';
import 'package:budget_tracking/core/utils/currency_format.dart';
import 'package:budget_tracking/core/utils/date_utils.dart';
import 'package:budget_tracking/domain/firebase_firestore/user/firestore_user_helper.dart';
import 'package:budget_tracking/domain/firebase_firestore/user/model/goal_model.dart';
import 'package:budget_tracking/presentation/financial_goal_detail/model/goal_view_model.dart';
import 'package:get/get.dart';

class FinancialGoalDetailController extends GetxController{

  final goal = Goal().obs;

  final isCompleted = false.obs;

  final goalViewModel = GoalViewModel().obs;

  final contributeList = <Contribute>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    subscribeGoalStream();
    subscribeContributeStream();
  }

  subscribeGoalStream(){
    Get.find<FirestoreUserCollectionHelper>().setGoalStream((goalData) {
      goal.value = goalData;
      _updateGaolData();
    });
  }

  void _updateGaolData(){
    double totalContribute = 0.0;
    for (var element in contributeList) {
      totalContribute = totalContribute + (element.amount??0);
    }
    double goalAmount = goal.value.amount??0;
    if(totalContribute >= goalAmount){
      isCompleted.value = true;
    }else{
      isCompleted.value = false;
    }
    isCompleted.refresh();
    double percentage = (100 * totalContribute)/goalAmount;
    int reamingMonth = 0;
    if(goal.value.goalDate != null){
      reamingMonth = getRemainingMonths(DateTime.now(),goal.value.goalDate!);
    }
    double reamingAmount = (goalAmount - totalContribute);

    goalViewModel.value = GoalViewModel(
      goal: goal.value.goal??"",
      goalDate: goal.value.goalDate != null ? goal.value.goalDate!.goalDateFormat : "Date Not Found",
      amount: goalAmount.convertUsFormat,
      percentage: double.parse(percentage.toStringAsFixed(0)),
      reamingAmount: reamingAmount.convertUsFormat,
      projectionAmount: (reamingAmount/reamingMonth).convertUsFormat,
      quote: _getMotivationSentence(percentage)
    );
    goalViewModel.refresh();
  }

  String _getMotivationSentence(double percentage){
    if(percentage <= 30){
      return motivationSentence30;
    }else if(percentage <= 50){
      return motivationSentence50;
    }else if(percentage <= 70){
      return motivationSentence70;
    }else if(percentage <= 90){
      return motivationSentence90;
    }else{
      return motivationSentence100;
    }
  }

  subscribeContributeStream(){
    Get.find<FirestoreUserCollectionHelper>().setContributeStream((contributesData) {
      contributeList.value  = contributesData;
      _updateGaolData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<FirestoreUserCollectionHelper>().closeContributeStream();
    Get.find<FirestoreUserCollectionHelper>().closeGoalStream();
  }


}
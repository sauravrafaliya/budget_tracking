// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/financial_goal_detail
// *******************************

import 'package:budget_tracking/core/utils/date_utils.dart';
import 'package:budget_tracking/domain/firebase_firestore/user/model/goal_model.dart';
import 'package:budget_tracking/presentation/financial_goal_detail/controller/financial_goal_detail_controller.dart';
import 'package:budget_tracking/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../core/app_export.dart';
import '../../theme/custom_text_style.dart';

class FinancialGoalScreen extends GetWidget<FinancialGoalDetailController> {
  const FinancialGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double barSize = context.height*0.4 >= 300 ? 300 : context.height*0.4;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        statusBarColor: AppTheme.primaryColor,
      ),
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Obx((){
                  final data = controller.goalViewModel.value;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(data.goal,style: CustomTextStyle.white30_600,maxLines: 1,overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 30,),
                      _buildCircularBar(data.percentage,barSize,controller.isCompleted.value),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(goalText,style: CustomTextStyle.black18_600.copyWith(color: Colors.white),),
                                  Text(data.goalDate,style: CustomTextStyle.black14_600.copyWith(color: AppTheme.lightGreyColor),)
                                ],
                              ),
                            ),
                            Text(data.amount,style: CustomTextStyle.white30_600,)
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Card(
                          color: controller.isCompleted.value ? Colors.green : Colors.blue,
                          surfaceTintColor: Colors.blue,
                          child: SizedBox(
                            width: context.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
                              child: controller.isCompleted.value ? Container(
                                height: 70,
                                alignment: Alignment.center,
                                child: const Text(congratulations,style: CustomTextStyle.white25_600,),
                              ) : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(needMoreSaving,style: CustomTextStyle.white16_600,),
                                      Text(data.reamingAmount,style: CustomTextStyle.white16_600,),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(monthlySavingProjection,style: CustomTextStyle.white16_600,),
                                      Text(data.projectionAmount,style: CustomTextStyle.white16_600,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(data.quote,
                          style: CustomTextStyle.white12_400,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(height: context.height*0.2,)
                    ],
                  );
                }),
                _buildDraggableSheet()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularBar(double barValue,double barSize,[bool isComplete = false]){
    return SizedBox(
      height: barSize,
      width: barSize,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 2000,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            annotations: [
              GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${barValue.toStringAsFixed(1)}%",
                        style: CustomTextStyle.white40_600,
                      ),
                      Text(isComplete ? "Completed" : saved,style: CustomTextStyle.grey18_400,)
                    ],
                  )
              )
            ],
            pointers: <GaugePointer>[
              RangePointer(
                value: barValue,
                cornerStyle: CornerStyle.bothCurve,
                width: 0.05,
                color: Colors.white,
                sizeUnit: GaugeSizeUnit.factor,
              )
            ],
            axisLineStyle: const AxisLineStyle(
              thickness: 0.05,
              cornerStyle: CornerStyle.bothCurve,
              color: AppTheme.lightGreyColor,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDraggableSheet(){
    return DraggableScrollableSheet(
      minChildSize: 0.2,
      maxChildSize: 0.7,
      initialChildSize: 0.2 ,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: CustomScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  toolbarHeight: 70,
                  title: const Text(contribution),
                  titleTextStyle: CustomTextStyle.black18_600.copyWith(fontSize: 24),
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  snap: true,
                  centerTitle: true,
                ),
                Obx(() => SliverToBoxAdapter(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.contributeList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context,index){
                      return const SizedBox(height: 0,);
                    },
                    itemBuilder: (context,index){
                      return _buildContributionCardWidget(controller.contributeList[index],context);
                    },
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContributionCardWidget(Contribute data,BuildContext context){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primaryColor),
          borderRadius: BorderRadius.circular(15)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title??"",style: CustomTextStyle.primary16_600,),
                  Text(data.date!.goalDateFormat,style: CustomTextStyle.black14_600,)
                ],
              ),
            ),
            Text("\$${data.amount}",style: CustomTextStyle.black18_600,)
          ],
        ),
      ),
    );
  }
}
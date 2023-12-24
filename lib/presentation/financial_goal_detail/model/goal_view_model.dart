// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/presentation/financial_goal_detail/model
// *******************************

// To parse this JSON data, do
//
//     final goalViewModel = goalViewModelFromJson(jsonString);


class GoalViewModel {
  String goal;
  double percentage;
  String goalDate;
  String reamingAmount;
  String amount;
  String projectionAmount;
  String quote;

  GoalViewModel({
    this.goal = "",
    this.percentage = 0.0,
    this.goalDate = "",
    this.reamingAmount = "",
    this.amount = "",
    this.projectionAmount = "",
    this.quote = "",
  });

  GoalViewModel copyWith({
    String? goal,
    double? percentage,
    String? goalDate,
    String? reamingAmount,
    String? amount,
    String? projectionAmount,
    String? quote,
  }) =>
      GoalViewModel(
        goal: goal ?? this.goal,
        percentage: percentage ?? this.percentage,
        goalDate: goalDate ?? this.goalDate,
        reamingAmount: reamingAmount ?? this.reamingAmount,
        amount: amount ?? this.amount,
        projectionAmount: projectionAmount ?? this.projectionAmount,
        quote: quote ?? this.quote,
      );


}

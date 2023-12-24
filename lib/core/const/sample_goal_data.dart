// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/core/const
// *******************************

import 'package:budget_tracking/domain/firebase_firestore/user/model/goal_model.dart';

Goal goal = Goal(
  amount: 50000,
  createAt: DateTime.now(),
  updateAt: DateTime.now(),
  goal: "Buy Dream Home",
  goalDate: DateTime(2030,10,10),
);

List<Contribute> contributes = [
  Contribute(
    createAt: DateTime.now(),
    amount: 15000,
    date: DateTime(2023,08,12),
    updateAt: DateTime.now(),
    title: "Monthly Salary"
  ),
  Contribute(
    createAt: DateTime.now(),
    amount: 7000,
    date: DateTime(2023,01,05),
    updateAt: DateTime.now(),
    title: "F.D"
  ),
  Contribute(
    createAt: DateTime.now(),
    amount: 3000,
    date: DateTime(2022,05,12),
    updateAt: DateTime.now(),
    title: "Saving"
  ),
];

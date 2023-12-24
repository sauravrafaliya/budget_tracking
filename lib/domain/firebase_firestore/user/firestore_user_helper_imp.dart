// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/domain/firebase_firestore/user
// *******************************

import 'package:flutter/cupertino.dart';

import 'model/goal_model.dart';

abstract class FirestoreUserHelperImp{

  Future<void> setSampleGoalData();

  void setGoalStream(ValueChanged<Goal>? onUpdate);

  void closeContributeStream();

  void closeGoalStream();

  void setContributeStream(ValueChanged<List<Contribute>>? onUpdate);
}
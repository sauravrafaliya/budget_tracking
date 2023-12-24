// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/domain/firebase_firestore
// *******************************

import 'dart:async';

import 'package:budget_tracking/core/const/sample_goal_data.dart';
import 'package:budget_tracking/core/utils/helper_fun.dart';
import 'package:budget_tracking/domain/firebase_firestore/firebase_caller.dart';
import 'package:budget_tracking/domain/firebase_firestore/user/model/goal_model.dart';
import 'package:budget_tracking/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_typedef.dart';
import 'firestore_user_helper_imp.dart';

class FirestoreUserCollectionHelper implements FirestoreUserHelperImp{

  static const String _userCollection = "user";
  static const String _contributeCollection = "contribute";

  static final _userRef = FirebaseFirestore.instance.collection(_userCollection);

  static Stream<QuerySnapshot<Map<String, dynamic>>>? contributeStream;
  static StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? contributeStreamSub;

  static Stream<DocumentSnapshot<Map<String, dynamic>>>? goalStream;
  static StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? goalStreamSub;

  @override
  Future<void> setSampleGoalData()async{
    try{
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if(userId != null){
        final userDocRef = _userRef.doc(userId);
        final response = await userDocRef.get();
        if(response.exists)return;
        await FireStoreCaller.caller<FSDocumentRef>(userDocRef,
          operation: FSOperation.set,
          payLoad: goal.copyWith(
            id: userId
          ).toJson()
        );
        await _setContributeSampleData(userId);
      }else{
        Get.offAndToNamed(AppRoutes.signInUpScreen);
      }
    }catch(e){
      HelperFun.buildSnackBar(e.toString());
    }
  }



  static _setContributeSampleData(String userId)async{
    final userDocRef = _userRef.doc(userId);
    try{
      for (var element in contributes) {
        final contRef = userDocRef.collection(_contributeCollection);
        final response = await FireStoreCaller.caller<FSCollectionRef>(contRef,
            operation: FSOperation.add,
            payLoad: element.toJson()
        );
        if(response is FSDocumentRef){
          await FireStoreCaller.caller<FSDocumentRef>(contRef.doc(response.id),
              operation: FSOperation.update,
              payLoad: Contribute(
                  id: response.id
              ).toJson()
          );
        }
      }
    }catch(e){
      try{
        await userDocRef.delete();
      }catch(_){}
      HelperFun.buildSnackBar(e.toString());
    }
  }

  @override
  void setGoalStream(ValueChanged<Goal>? onUpdate){
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if(userId != null){
      goalStream = _userRef.doc(userId).snapshots();
      goalStreamSub = goalStream?.listen((event)async {
        if(onUpdate != null){
          onUpdate(Goal.fromDocumentSnapshot(documentSnapshot: event));
        }
      });
    }

  }


  @override
  void closeContributeStream(){
    contributeStreamSub?.cancel();
  }

  @override
  void closeGoalStream(){
    goalStreamSub?.cancel();
  }

  @override
  void setContributeStream(ValueChanged<List<Contribute>>? onUpdate){
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if(userId != null){
      contributeStream = _userRef.doc(userId).collection(_contributeCollection).snapshots();
      contributeStreamSub = contributeStream?.listen((event)async {
        List<Contribute> data = event.docs.map((e) => Contribute.fromQueryDocumentSnapshot(queryDocumentSnapshot: e)).toList();
        if(onUpdate != null){
          onUpdate(data);
        }
      });
    }
  }



}
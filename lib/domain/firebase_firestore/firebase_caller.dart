// // *******************************
// // Develop by : Saurav Rafaliya
// // Date : 24 December,2023
// // Path : lib/domain/firebase_firestore
// // *******************************

import 'dart:io';

import 'package:budget_tracking/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/utils/app_typedef.dart';
import '../../routes/app_routes.dart';

class FireStoreCaller{

  static Future<Object?> caller<T>(T ref,{
    Map<String,dynamic> payLoad = const {},
    FSOperation? operation
  })async{

    Object? response;
    try{
      if(FirebaseAuth.instance.currentUser == null){
        Get.offAndToNamed(AppRoutes.signInUpScreen);
        return null;
      }
      if(T == FSDocumentRef && operation != null){
        switch(operation) {
          case FSOperation.set:
            await (ref as FSDocumentRef).set(payLoad);
          case FSOperation.update:
            await (ref as FSDocumentRef).update(payLoad);
          case FSOperation.delete:
            await (ref as FSDocumentRef).delete();
          default:
            throw Exception("Unknown operation");
        }
      }else if(T == FSDocumentRef){
        response = await (ref as FSDocumentRef).get();
      }else if(T == FSCollectionRef && operation == FSOperation.add){
        response = await (ref as FSCollectionRef).add(payLoad);
      }else if(T == FSCollectionRef){
        response = await (ref as FSCollectionRef).get();
      }else{
        throw Exception("Unknown operation");
      }
      return response;
    }on FirebaseException catch(e){
      throw FireException(e.message);
    }on SocketException catch(e){
      throw NoInternetException(errCheckInternet);
    }catch (e){
      throw ServerException(errSomethingWentWrong);
    }
  }


}

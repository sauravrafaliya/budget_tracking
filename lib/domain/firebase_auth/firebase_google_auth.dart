// *******************************
// Develop by : Saurav Rafaliya
// Date : 24 December,2023
// Path : lib/domain/firebase_auth/firebase_google_auth
// *******************************

import 'package:budget_tracking/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseGoogleAuthHelperImp{

  Future<UserCredential> signInWithGoogle();

  Future<void> isNetworkConnected();

  bool alreadySignIn();

  Future<void> signOutWithGoogle();

}

class FirebaseGoogleAuthHelper implements FirebaseGoogleAuthHelperImp{

  @override
  Future<UserCredential> signInWithGoogle() async {

    try {

      await isNetworkConnected();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseException catch (error) {
      throw FireException(error.message);
    }catch (error){
      throw ServerException();
    }
  }

  @override
  Future<void> isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  @override
  bool alreadySignIn() {
    bool alreadySignIn = false;
    if (FirebaseAuth.instance.currentUser != null) {
      alreadySignIn = true;
    } else {
      alreadySignIn = false;
    }
    return alreadySignIn;
  }

  @override
  Future<void> signOutWithGoogle() async {
    await FirebaseAuth.instance.signOut();
  }

}
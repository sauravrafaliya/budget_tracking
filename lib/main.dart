import 'package:budget_tracking/routes/app_routes.dart';
import 'package:budget_tracking/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/initial_bindings.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

GlobalKey<ScaffoldMessengerState> globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: GetMaterialApp(
        initialRoute: FirebaseAuth.instance.currentUser != null ? AppRoutes.financialGoalScreen : AppRoutes.signInUpScreen,
        initialBinding: InitialBindings(),
        getPages: AppRoutes.pages,
        debugShowCheckedModeBanner: false,
        title: 'Budget Tracking',
        scaffoldMessengerKey: globalMessengerKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: AppTheme.poppinsFont,
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
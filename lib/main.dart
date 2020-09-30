import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/themes/app_theme.dart';
import 'services/service_locator.dart';
import 'views/screens/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ServicesBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Impresa',
      theme: AppTheme.lightThemeData,
      home: AuthWrapper(),
    );
  }
}

import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';
import 'views/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Impresa',
      theme: AppTheme.lightThemeData,
      home: LoginScreen(),
    );
  }
}

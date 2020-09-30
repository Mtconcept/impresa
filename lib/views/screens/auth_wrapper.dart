import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_wrapper_controller.dart';
import '../../models/app_user.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthWrapperController>(
      init: AuthWrapperController(),
      builder: (controller) {
        return FutureBuilder<AppUser>(
          future: controller.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData
                  ? HomeScreen(user: snapshot.data)
                  : LoginScreen();
            } else {
              return SplashScreen();
            }
          },
        );
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/validation_mixin.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/register_screen.dart';

class LoginController extends GetxController with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer register;
  String email;
  String password;
  var user;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    register = TapGestureRecognizer()
      ..onTap = () {
        Get.off(RegisterScreen());
      };
    super.onInit();
  }

  void validateForm() {
    formKey.currentState.validate();
  }

  void signInUser() async {
    validateForm();
    user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (user != null) {
      Get.to(HomeScreen());
    }
  }
}

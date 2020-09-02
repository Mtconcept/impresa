import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/validation_mixin.dart';
import '../views/screens/login_screen.dart';

class RegisterController extends GetxController with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer login;

  @override
  void onInit() {
    login = TapGestureRecognizer()
      ..onTap = () {
        Get.off(LoginScreen());
      };
    super.onInit();
  }

  void validateForm() {
    formKey.currentState.validate();
  }
}

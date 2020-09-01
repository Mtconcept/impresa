import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/validation_mixin.dart';
import '../views/screens/register_screen.dart';

class LoginController extends GetxController with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer register;

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
}

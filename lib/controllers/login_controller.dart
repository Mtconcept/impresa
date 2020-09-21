import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';
import '../models/app_user.dart';
import '../models/login_params.dart';
import '../services/auth_service/auth_service.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/register_screen.dart';

class LoginController extends Notifier with ValidationMixin {
  final passwordFocusNode = FocusNode();

  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPasswordField = true;
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

  void loginUser() async {
    if (formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      try {
        LoginParams params = LoginParams(
          emailAddress: emailAddressController.text.trim(),
          password: passwordController.text,
        );

        AppUser user = await Get.find<AuthService>().login(params);

        setState(NotifierState.isIdle);
        Get.off(HomeScreen(user: user));
      } on Failure catch (f) {
        setState(NotifierState.isIdle);
        Get.snackbar(
          'Error',
          f.message,
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);
    }
  }

  void focusToPassword(String value) {
    passwordFocusNode.requestFocus();
  }

  void togglePasswordFieldVisibility() {
    showPasswordField = !showPasswordField;
    update();
  }
}

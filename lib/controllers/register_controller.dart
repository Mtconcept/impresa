import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';
import '../models/app_user.dart';
import '../models/register_params.dart';
import '../services/auth_service/auth_service.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/login_screen.dart';

class RegisterController extends Notifier with ValidationMixin {
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final fullNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPasswordField = true;
  final formKey = GlobalKey<FormState>();
  //String fullName, emailAddress, phoneNumber, password;
  TapGestureRecognizer login;

  AppUser _user;
  AppUser get user => _user;

  @override
  void onInit() {
    login = TapGestureRecognizer()
      ..onTap = () {
        Get.off(LoginScreen());
      };
    super.onInit();
  }

  void registerUser() async {
    if (formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      try {
        RegisterParams params = RegisterParams(
          emailAddress: emailAddressController.text.trim(),
          password: passwordController.text,
          fullName: fullNameController.text.trim(),
          phoneNumber: phoneNumberController.text,
        );

        _user = await Get.find<AuthService>().register(params);

        setState(NotifierState.isIdle);
        Get.to(HomeScreen());
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

  void focusToEmail(String value) {
    emailFocusNode.requestFocus();
  }

  void focusToPhone(String value) {
    phoneFocusNode.requestFocus();
  }

  void focusToPassword(String value) {
    passwordFocusNode.requestFocus();
  }

  void togglePasswordFieldVisibility() {
    showPasswordField = !showPasswordField;
    update();
  }
}

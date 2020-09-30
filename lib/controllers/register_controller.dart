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
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  TapGestureRecognizer _login;
  final _formKey = GlobalKey<FormState>();
  bool _showPasswordField = true;

  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get phoneFocusNode => _phoneFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get passwordController => _passwordController;

  TapGestureRecognizer get login => _login;
  GlobalKey<FormState> get formKey => _formKey;
  bool get showPasswordField => _showPasswordField;

  @override
  void onInit() {
    _login = TapGestureRecognizer()
      ..onTap = () {
        Get.off(LoginScreen());
      };
    super.onInit();
  }

  void registerUser() async {
    Get.focusScope.unfocus();

    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      try {
        RegisterParams params = RegisterParams(
          emailAddress: _emailAddressController.text.trim(),
          password: _passwordController.text,
          fullName: _fullNameController.text.trim(),
          phoneNumber: _phoneNumberController.text,
        );

        AppUser user = await Get.find<AuthService>().register(params);

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

  void focusToEmail(String value) {
    _emailFocusNode.requestFocus();
  }

  void focusToPhone(String value) {
    _phoneFocusNode.requestFocus();
  }

  void focusToPassword(String value) {
    _passwordFocusNode.requestFocus();
  }

  void togglePasswordFieldVisibility() {
    _showPasswordField = !_showPasswordField;
    update();
  }
}

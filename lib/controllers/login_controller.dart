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
  final _passwordFocusNode = FocusNode();

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showPasswordField = true;
  final _formKey = GlobalKey<FormState>();
  TapGestureRecognizer _register;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get passwordController => _passwordController;

  TapGestureRecognizer get register => _register;
  GlobalKey<FormState> get formKey => _formKey;
  bool get showPasswordField => _showPasswordField;

  @override
  void onInit() {
    _register = TapGestureRecognizer()
      ..onTap = () {
        Get.off(RegisterScreen());
      };
    super.onInit();
  }

  void loginUser() async {
    FocusNode().requestFocus();

    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      try {
        LoginParams params = LoginParams(
          emailAddress: _emailAddressController.text.trim(),
          password: _passwordController.text,
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
    _passwordFocusNode.requestFocus();
  }

  void togglePasswordFieldVisibility() {
    _showPasswordField = !_showPasswordField;
    update();
  }
}

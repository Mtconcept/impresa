import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';
import '../models/app_user.dart';
import '../services/auth_service/auth_service.dart';
import '../views/screens/home_screen.dart';

class LoginAnonymouslyController extends Notifier with ValidationMixin {
  TapGestureRecognizer loginAnonymously;

  @override
  void onInit() {
    loginAnonymously = TapGestureRecognizer()..onTap = loginAnon;
    super.onInit();
  }

  void loginAnon() async {
    setState(NotifierState.isLoading);

    try {
      AppUser user = await Get.find<AuthService>().loginAnonymously();
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

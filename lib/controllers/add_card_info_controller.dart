import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';

class AddCardInfoController extends Notifier with ValidationMixin {
  final brandNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final brandAddressFocusNode = FocusNode();
  final businessTaglineFocusNode = FocusNode();

  final fullNameController = TextEditingController();
  final brandNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final brandAddressController = TextEditingController();
  final businessTaglineController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void saveCard() async {
    if (formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      // I will Save Card Here

      try {} on Failure catch (f) {
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

  void focusToBrandName(String value) {
    brandNameFocusNode.requestFocus();
  }

  void focusToPhoneNumber(String value) {
    phoneNumberFocusNode.requestFocus();
  }

  void focusToBrandAddress(String value) {
    brandAddressFocusNode.requestFocus();
  }

  void focusToBusinessTagline(String value) {
    businessTaglineFocusNode.requestFocus();
  }
}

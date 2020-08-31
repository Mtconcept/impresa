import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/validation_mixin.dart';

class LoginController extends GetxController with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  void validateForm() {
    formKey.currentState.validate();
  }
}

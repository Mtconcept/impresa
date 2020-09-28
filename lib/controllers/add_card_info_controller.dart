import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';

class AddCardInfoController extends Notifier with ValidationMixin {
  final _brandNameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _brandAddressFocusNode = FocusNode();
  final _businessTaglineFocusNode = FocusNode();

  final _fullNameController = TextEditingController();
  final _brandNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _brandAddressController = TextEditingController();
  final _businessTaglineController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File _image;

  FocusNode get brandNameFocusNode => _brandNameFocusNode;
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;
  FocusNode get brandAddressFocusNode => _brandAddressFocusNode;
  FocusNode get businessTaglineFocusNode => _businessTaglineFocusNode;

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get brandNameController => _brandNameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get brandAddressController => _brandAddressController;
  TextEditingController get businessTaglineController =>
      _businessTaglineController;

  GlobalKey<FormState> get formKey => _formKey;
  File get image => _image;

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      Get.snackbar(
        'Error',
        'No Image was picked',
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveCard() async {
    FocusNode().requestFocus();
    if (_formKey.currentState.validate()) {
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

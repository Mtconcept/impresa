import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:impresa/views/screens/card_preview_screen.dart';

import '../core/utils/failure.dart';
import '../core/utils/notifier.dart';
import '../core/utils/validation_mixin.dart';
import '../models/app_user.dart';
import '../models/card_info.dart';
import '../models/card_params.dart';
import '../services/auth_service/auth_service.dart';
import '../services/database/database_service.dart';

class AddCardInfoController extends Notifier with ValidationMixin {
  final _postFocusNode = FocusNode();
  final _brandNameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _brandAddressFocusNode = FocusNode();
  final _emailAddressFocusNode = FocusNode();
  final _businessTaglineFocusNode = FocusNode();
  final _socialMediaHandleFocusNode = FocusNode();

  final _fullNameController = TextEditingController();
  final _postController = TextEditingController();
  final _brandNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _brandAddressController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _businessTaglineController = TextEditingController();
  final _socialMediaHandleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File _image;

  FocusNode get postFocusNode => _postFocusNode;
  FocusNode get brandNameFocusNode => _brandNameFocusNode;
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;
  FocusNode get brandAddressFocusNode => _brandAddressFocusNode;
  FocusNode get emailAddressFocusNode => _emailAddressFocusNode;
  FocusNode get businessTaglineFocusNode => _businessTaglineFocusNode;
  FocusNode get socialMediaHandleFocusNode => _socialMediaHandleFocusNode;

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get postController => _postController;
  TextEditingController get brandNameController => _brandNameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get brandAddressController => _brandAddressController;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get businessTaglineController =>
      _businessTaglineController;
  TextEditingController get socialMediaHandleController =>
      _socialMediaHandleController;

  GlobalKey<FormState> get formKey => _formKey;
  File get image => _image;

  void goBack() {
    Get.back();
  }

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
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
    update();
  }

  void saveCard(int id) {
    Get.focusScope.unfocus();

    AppUser user = Get.find<AuthService>().user;
    if (user.isAnonymous) {
      addCardInfoForAnonymousUser(id);
    }
    addCardInfo(user, id);
  }

  void addCardInfoForAnonymousUser(int cardId) async {
    if (_image != null) {
      if (_formKey.currentState.validate()) {
        setState(NotifierState.isLoading);

        try {
          String url = await Get.find<DatabaseService>()
              .uploadLogoForAnonymousUser(_image);

          CardInfo cardInfo = CardInfo(
            fullName: fullNameController.text.trim(),
            brandName: brandNameController.text.trim(),
            address: brandAddressController.text.trim(),
            emailAddress: emailAddressController.text.trim(),
            jobPosition: postController.text.trim(),
            logoUrl: url,
            phoneNumber: phoneNumberController.text.trim(),
            socialOrWebLink: socialMediaHandleController.text.trim(),
            tagline: businessTaglineController.text.trim(),
          );

          Get.to(CardPreviewScreen(id: cardId, cardInfo: cardInfo));
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
    } else {
      Get.snackbar(
        'No Logo',
        "Please upload your Business Logo",
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void addCardInfo(AppUser user, int cardId) async {
    if (_image != null) {
      if (_formKey.currentState.validate()) {
        setState(NotifierState.isLoading);

        try {
          CardParams params = CardParams(
            userId: user.id,
            emailAddress: _emailAddressController.text.trim(),
            fullName: _fullNameController.text.trim(),
            phoneNumber: _phoneNumberController.text.trim(),
            address: _brandAddressController.text.trim(),
            brandName: _brandNameController.text.trim(),
            jobPosition: _postController.text.trim(),
            logoImage: _image,
            socialOrWebLink: _socialMediaHandleController.text.trim(),
            tagline: _businessTaglineController.text.trim(),
          );

          CardInfo cardInfo =
              await Get.find<DatabaseService>().addCardInfo(params);

          Get.to(CardPreviewScreen(id: cardId, cardInfo: cardInfo));
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
    } else {
      Get.snackbar(
        'No Logo',
        "Please upload your Business Logo",
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void validateImage() {
    if (_image == null) {
      Get.snackbar(
        'No Logo',
        "Please upload your Business Logo",
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
  }

  void focusToPost(String value) {
    _postFocusNode.requestFocus();
  }

  void focusToBrandName(String value) {
    _brandNameFocusNode.requestFocus();
  }

  void focusToPhoneNumber(String value) {
    _phoneNumberFocusNode.requestFocus();
  }

  void focusToBrandAddress(String value) {
    _brandAddressFocusNode.requestFocus();
  }

  void focusToEmailAddress(String value) {
    _emailAddressFocusNode.requestFocus();
  }

  void focusToBusinessTagline(String value) {
    _businessTaglineFocusNode.requestFocus();
  }

  void focusToSocialMediaHandle(String value) {
    _socialMediaHandleFocusNode.requestFocus();
  }
}

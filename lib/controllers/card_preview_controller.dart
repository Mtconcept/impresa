import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/utils/widget_to_image_util.dart';
import '../models/card_info.dart';

class CardPreviewController extends GetxController {
  GlobalKey frontKey;
  GlobalKey backKey;

  void goBack() {
    Get.back();
  }

  void shareCard(CardInfo cardInfo) async {
    final frontBytes = await WidgetToImageUtil.capture(frontKey);
    final backBytes = await WidgetToImageUtil.capture(backKey);

    await WidgetToImageUtil.shareBusinessCard(
        cardInfo.brandName, frontBytes, backBytes);
  }

  void downloadCard(CardInfo cardInfo) async {
    final frontBytes = await WidgetToImageUtil.capture(frontKey);
    final backBytes = await WidgetToImageUtil.capture(backKey);

    List<Uint8List> cards = [frontBytes, backBytes];
    List<File> cardFiles = [];

    for (int i = 0; i < cards.length; i++) {
      File file = await WidgetToImageUtil.saveCard(
          '${cardInfo.brandName}-i-${DateTime.now()}', cards[i]);
      cardFiles.add(file);
    }

    if (cardFiles.length == cards.length) {
      Get.snackbar(
        'Successful',
        'Cards saved successfully',
        colorText: Get.theme.primaryColor,
        backgroundColor: Get.theme.colorScheme.onPrimary,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong',
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:impresa/models/card_info.dart';

import '../core/utils/widget_to_image_util.dart';

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

    // Find Implementation in Widget To Image Utility
    bool isSuccessful =
        await WidgetToImageUtil.saveCard(cardInfo.brandName, cards);

    if (isSuccessful) {
      Get.snackbar(
        'Successful',
        'Cards saved successfully',
        colorText: Get.theme.colorScheme.onPrimary,
        backgroundColor: Get.theme.primaryColor,
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

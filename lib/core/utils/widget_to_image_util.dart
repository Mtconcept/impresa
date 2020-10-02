import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetToImageUtil {
  static Future<Uint8List> capture(GlobalKey key) async {
    if (key == null) return null;

    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData.buffer.asUint8List();

    return pngBytes;
  }

  static Future<void> shareBusinessCard(String cardName,
      Uint8List cardFrontBytes, Uint8List cardBackBytes) async {
    await Share.files(
        'Share Business Card',
        {
          '${cardName}front.png': cardFrontBytes,
          '${cardName}back.png': cardBackBytes,
        },
        'image/png');
  }

  // Implement this
  static Future<bool> saveCard(String cardName, List<Uint8List> cards) async {
    return true;
  }
}

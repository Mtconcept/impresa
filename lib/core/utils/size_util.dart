import 'package:flutter/cupertino.dart';

class SizeUtil {
  BuildContext context;

  SizeUtil(this.context);

  double get cardHeight => (MediaQuery.of(context).size.width * 0.57777) - 40;
  double get cardWidth => MediaQuery.of(context).size.width;
}

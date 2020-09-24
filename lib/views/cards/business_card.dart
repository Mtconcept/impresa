import 'package:flutter/cupertino.dart';

import '../../core/utils/card_view.dart';
import '../../models/card_info.dart';

abstract class BusinessCard {
  int get id;
  CardView get cardView;
  CardInfo get cardInfo;
  List<String> get tags;
  Widget front(BuildContext context);
  Widget back(BuildContext context);
}

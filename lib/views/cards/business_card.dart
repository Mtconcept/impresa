import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../core/utils/card_view.dart';
import '../../models/card_info.dart';

abstract class BusinessCard extends StatelessWidget {
  int get id;
  List<String> get tags;

  final CardView cardView;
  final CardInfo cardInfo;

  BusinessCard({
    @required this.cardView,
    @required this.cardInfo,
  });

  Widget front(BuildContext context);
  Widget back(BuildContext context);
}

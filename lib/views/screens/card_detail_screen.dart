import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impresa/core/utils/card_view.dart';
import 'package:impresa/models/card_info.dart';

import '../../controllers/card_detail_controller.dart';
import '../cards/business_cards_list.dart';
import '../widgets/transparent_status_bar.dart';

class CardDetailScreen extends StatelessWidget {
  final int id;
  const CardDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return TransparentStatusBar(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: GetBuilder<CardDetailController>(
            init: CardDetailController(),
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              child: ListView(
                children: [
                  navigateBack(context, controller),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Front View',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: onPrimary),
                    ),
                  ),
                  SizedBox(height: 16),
                  Hero(
                      tag: 'card$id',
                      child: cards(
                        CardView.front,
                        CardInfo.app(),
                      )[id]),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Back View',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: onPrimary),
                    ),
                  ),
                  SizedBox(height: 16),
                  cards(
                    CardView.back,
                    CardInfo.app(),
                  )[id],
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text('Customize Card'),
                    onPressed: () => controller.goToAddCardInfo(id),
                    color: Theme.of(context).colorScheme.onPrimary,
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navigateBack(BuildContext context, CardDetailController controller) =>
      InkWell(
        onTap: controller.goBack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            SizedBox(height: 12),
            Text('Back', style: Theme.of(context).textTheme.caption),
          ],
        ),
      );
}

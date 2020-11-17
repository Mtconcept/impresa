import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/card_preview_controller.dart';
import '../../core/utils/card_view.dart';
import '../../models/card_info.dart';
import '../cards/business_cards_list.dart';
import '../widgets/transparent_status_bar.dart';
import '../widgets/widget_to_image.dart';

class CardPreviewScreen extends StatelessWidget {
  final int id;
  final CardInfo cardInfo;

  const CardPreviewScreen({
    @required this.id,
    @required this.cardInfo,
  });

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return TransparentStatusBar(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: GetBuilder<CardPreviewController>(
            init: CardPreviewController(),
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
                    child: WidgetToImage(
                      builder: (key) {
                        controller.frontKey = key;
                        return cards(
                          CardView.front,
                          cardInfo,
                        )[id];
                      },
                    ),
                  ),
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
                  WidgetToImage(
                    builder: (key) {
                      controller.backKey = key;
                      return cards(CardView.back, cardInfo)[id];
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          child: Text('Share'),
                          onPressed: () => controller.shareCard(cardInfo),
                          color: Theme.of(context).colorScheme.onPrimary,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Download'),
                          onPressed: () => controller.downloadCard(cardInfo),
                          color: Theme.of(context).colorScheme.onPrimary,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navigateBack(BuildContext context, CardPreviewController controller) =>
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/business_cards_controller.dart';
import '../cards/card1.dart';
import '../widgets/white_status_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<BusinessCardsController>(
            init: BusinessCardsController(),
            builder: (controller) {
              return Column(
                children: [
                  homeHeader(context, controller),
                  SizedBox(height: 4.0),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Card1(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget homeHeader(BuildContext context, BusinessCardsController controller) =>
      Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose A\nTemplate',
                  style: Theme.of(context).textTheme.headline1,
                ),
                InkWell(
                  onTap: controller.updateView,
                  child: Icon(Icons.swap_vertical_circle, size: 36),
                )
              ],
            ),
            SizedBox(height: 4.0),
            Text(
              'Start customizing your business life',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Template',
                fillColor: Color(0xFFF9F9F9),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      );
}

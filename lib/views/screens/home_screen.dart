import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impresa/core/utils/card_view.dart';
import 'package:impresa/models/card_info.dart';

import '../../controllers/home_controller.dart';
import '../../models/app_user.dart';
import '../cards/business_cards_list.dart';
import '../widgets/white_status_bar.dart';

class HomeScreen extends StatelessWidget {
  final AppUser user;
  const HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Column(
                children: [
                  homeHeader(context, controller),
                  SizedBox(height: 4.0),
                  cardsList(controller),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget homeHeader(BuildContext context, HomeController controller) =>
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
                  onTap: () {
                    controller.signOut();
                  },
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

  Widget cardsList(HomeController controller) => Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
          decoration: BoxDecoration(
            color: Color(0xFFEEEBF3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: cards(CardView.front, CardInfo.app())
                .map(
                  (card) => GestureDetector(
                    onTap: () => controller.goToCardDetail(card.id),
                    child: Column(
                      children: [
                        Hero(tag: 'card$card.id', child: card),
                        SizedBox(height: 32)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}

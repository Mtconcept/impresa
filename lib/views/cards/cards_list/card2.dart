import 'package:flutter/material.dart';

import '../../../core/utils/card_view.dart';
import '../../../core/utils/image_util.dart';
import '../../../models/card_info.dart';
import '../../widgets/business_card_container.dart';
import '../business_card.dart';

class Card2 extends BusinessCard {
  final int id = 2;
  final List<String> tags = const ['Example'];

  Card2({
    @required CardView cardView,
    @required CardInfo cardInfo,
  }) : super(
          cardView: cardView,
          cardInfo: cardInfo,
        );

  @override
  Widget build(BuildContext context) {
    return cardView == CardView.front ? front(context) : back(context);
  }

  @override
  Widget front(BuildContext context) {
    return BusinessCardContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageUtil.logo(id),
            width: 40,
            height: 40,
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardInfo.brandName.toUpperCase(),
                style: titleStyle,
              ),
              SizedBox(height: 6.0),
              Text(
                cardInfo.tagline,
                style: subTitleStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget back(BuildContext context) {
    return BusinessCardContainer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUtil.logo(id),
                  width: 40,
                  height: 40,
                ),
                SizedBox(height: 6.0),
                Text(
                  cardInfo.brandName.toUpperCase(),
                  style: titleStyle.copyWith(fontSize: 10),
                ),
                SizedBox(height: 6.0),
                Text(
                  cardInfo.tagline,
                  style: subTitleStyle,
                ),
              ],
            ),
            SizedBox(width: 8.0),
            VerticalDivider(color: Colors.black54),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardInfo.fullName,
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  cardInfo.jobPosition,
                  style: subTitleStyle,
                ),
                SizedBox(height: 18),
                IconAndText(
                  icon: Icons.location_on,
                  text: cardInfo.address,
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.phone,
                  text: cardInfo.phoneNumber,
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.email,
                  text: cardInfo.emailAddress,
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.link,
                  text: cardInfo.socialOrWebLink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconAndText({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: primary,
          size: 8,
        ),
        SizedBox(width: 4.0),
        Text(
          text,
          style: list,
        ),
      ],
    );
  }
}

Color primary = Color(0xFF805320);

TextStyle get globalStyle => TextStyle(
      fontFamily: 'Lato',
      color: Color(0xFF120E1A),
    );

TextStyle get list => globalStyle.copyWith(
      fontSize: 6,
    );

TextStyle get titleStyle => globalStyle.copyWith(
      fontSize: 12,
    );

TextStyle get subTitleStyle => globalStyle.copyWith(
      fontSize: 8,
    );

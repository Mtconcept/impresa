import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/card_view.dart';
import '../../../core/utils/image_util.dart';
import '../../../core/utils/size_util.dart';
import '../../../models/card_info.dart';
import '../../widgets/business_card_container.dart';
import '../business_card.dart';

class Card0 extends BusinessCard {
  final int id = 0;
  final List<String> tags = const ['Example'];

  Card0({
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
      child: Stack(
        children: [
          SvgPicture.asset(
            ImageUtil.frontBg(id),
            fit: BoxFit.cover,
            width: double.infinity,
            height: SizeUtil(context).cardHeight,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageUtil.logo(id),
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    cardInfo.brandName,
                    style: titleStyle,
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    cardInfo.tagline,
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget back(BuildContext context) {
    return BusinessCardContainer(
      child: Stack(
        children: [
          SvgPicture.asset(
            ImageUtil.backBg(id),
            fit: BoxFit.cover,
            height: SizeUtil(context).cardHeight,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Your',
                        style: titleStyle.copyWith(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Name',
                            style: titleStyle.copyWith(color: primary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Your post here',
                      style: subTitleStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                IconAndText(
                  icon: Icons.location_on,
                  text: 'Your Full Work Address Here',
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.phone,
                  text: 'Your Phone Number Here',
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.email,
                  text: 'Your Email Address Here',
                ),
                SizedBox(height: 6),
                IconAndText(
                  icon: Icons.link,
                  text: 'Your Full Work Address Here',
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: Container(
              width: (SizeUtil(context).cardWidth / 3.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageUtil.logo(id),
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    cardInfo.brandName,
                    style: titleStyle,
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    cardInfo.tagline,
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
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

Color primary = Color(0xFFDD2C2C);

TextStyle get list => globalStyle.copyWith(fontSize: 6, color: Colors.white);

TextStyle get globalStyle => TextStyle(
      fontFamily: 'Lato',
      color: Color(0xFF120E1A),
    );

TextStyle get titleStyle => globalStyle.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 12,
    );

TextStyle get subTitleStyle => globalStyle.copyWith(
      fontSize: 8,
    );

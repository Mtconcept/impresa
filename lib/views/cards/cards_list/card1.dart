import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/card_view.dart';
import '../../../core/utils/image_util.dart';
import '../../../core/utils/size_util.dart';
import '../../../models/card_info.dart';
import '../../widgets/business_card_container.dart';
import '../business_card.dart';

class Card1 extends StatelessWidget implements BusinessCard {
  @override
  final int id = 1;

  @override
  final CardView cardView;

  @override
  final CardInfo cardInfo;

  @override
  final List<String> tags = const ['Example'];

  const Card1({
    @required this.cardView,
    @required this.cardInfo,
  });

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
            child: Container(
              width: (SizeUtil(context).cardWidth / 2) - 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageUtil.logo(1),
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    cardInfo.brandName,
                    style: titleStyle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    cardInfo.tagline,
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  cardInfo.tagline,
                  style: subTitleStyle,
                ),
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
            child: Container(
              width: (SizeUtil(context).cardWidth / 2) - 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Name',
                    style: titleStyle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Your post here',
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: (SizeUtil(context).cardWidth / 3) - 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
          color: Colors.white,
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

TextStyle get list => globalStyle.copyWith(
      fontSize: 6,
    );

TextStyle get globalStyle => TextStyle(
      fontFamily: 'Lato',
      color: Colors.white,
    );

TextStyle get titleStyle => globalStyle.copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 12,
    );

TextStyle get subTitleStyle => globalStyle.copyWith(
      fontSize: 8,
    );

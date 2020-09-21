import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/card_view.dart';
import '../widgets/business_card_container.dart';
import '../../core/utils/size_util.dart';

class Card1 extends StatelessWidget {
  final CardView cardView;

  const Card1({Key key, @required this.cardView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardView == CardView.front ? front(context) : back();
  }

  Widget front(BuildContext context) {
    return BusinessCardContainer(
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/card1_front_bg.svg',
            fit: BoxFit.cover,
            height: SizeUtil(context).cardHeight,
          ),
        ],
      ),
    );
  }

  Widget back() {
    return BusinessCardContainer(
      child: Center(
        child: Text('Hello Back'),
      ),
    );
  }
}

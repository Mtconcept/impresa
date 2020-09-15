import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/business_cards_controller.dart';
import '../widgets/business_card_container.dart';

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessCardsController>(
      builder: (controller) => controller.isFront ? front() : back(),
    );
  }

  Widget front() {
    return BusinessCardContainer(
      child: Center(
        child: Text('Hello Front'),
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

import '../../core/utils/card_view.dart';
import '../../models/card_info.dart';
import 'business_card.dart';
import 'cards_list/card0.dart';
import 'cards_list/card1.dart';

List<BusinessCard> cards(CardView cardView, CardInfo cardInfo) =>
    <BusinessCard>[
      Card0(
        cardView: cardView,
        cardInfo: cardInfo,
      ),
      Card1(
        cardView: cardView,
        cardInfo: cardInfo,
      ),
    ];

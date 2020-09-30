import 'package:get/get.dart';
import 'package:impresa/views/screens/add_card_info_screen.dart';

class CardDetailController extends GetxController {
  void goBack() {
    Get.back();
  }

  void goToAddCardInfo(int cardId) {
    Get.to(AddCardInfoScreen(id: cardId));
  }
}

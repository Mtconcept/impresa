import 'package:get/get.dart';
import 'package:impresa/core/utils/card_view.dart';
import 'package:impresa/views/screens/card_detail_screen.dart';

import '../services/auth_service/auth_service.dart';
import '../views/screens/login_screen.dart';

class HomeController extends GetxController {
  CardView defaultView = CardView.front;

  void toggleView() {
    defaultView == CardView.front
        ? defaultView = CardView.back
        : defaultView = CardView.front;
    update();
  }

  void goToCardDetail(int cardId) {
    Get.to(CardDetailScreen(id: cardId));
  }

  void signOut() async {
    await Get.find<AuthService>().signOut();
    Get.off(LoginScreen());
  }
}

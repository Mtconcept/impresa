import 'package:get/get.dart';

import '../services/auth_service/auth_service.dart';
import '../views/screens/login_screen.dart';

class HomeController extends GetxController {
  bool isFront = true;

  void updateView() {
    isFront = !isFront;
    update();
  }

  void signOut() async {
    await Get.find<AuthService>().signOut();
    Get.off(LoginScreen());
  }
}

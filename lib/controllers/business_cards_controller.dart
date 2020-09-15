import 'package:get/get.dart';

class BusinessCardsController extends GetxController {
  bool isFront = true;

  updateView() {
    isFront = !isFront;
    update();
  }
}

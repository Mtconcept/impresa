import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/screens/register_screen.dart';

class OnboardingController extends GetxController {
  int _currentIndex = 0;
  PageController _pageController;
  Duration _kDuration = const Duration(milliseconds: 300);
  Cubic _kCurve = Curves.ease;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  Future<void> onClose() {
    _pageController.dispose();
    return super.onClose();
  }

  void onChangedFunction(int index) {
    _currentIndex = index;
    update();
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  void register() {
    Get.to(RegisterScreen());
  }
}

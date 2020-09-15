import 'package:get/get.dart';

enum NotifierState { isLoading, isIdle }

class Notifier extends GetxController {
  NotifierState _state = NotifierState.isIdle;

  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    update();
  }
}

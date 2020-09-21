import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/app_user.dart';
import '../services/auth_service/auth_service.dart';

class AuthWrapperController extends GetxController {
  Future<AppUser> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return Get.find<AuthService>().user;
  }
}

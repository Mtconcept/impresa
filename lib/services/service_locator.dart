import 'package:get/get.dart';

import 'auth_service/auth_service.dart';
import 'auth_service/firebase_auth_service.dart';

class ServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => FirebaseAuthService(), fenix: true);
  }
}

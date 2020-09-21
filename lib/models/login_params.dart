import 'package:flutter/foundation.dart';

class LoginParams {
  final String emailAddress;
  final String password;

  LoginParams({
    @required this.emailAddress,
    @required this.password,
  });
}

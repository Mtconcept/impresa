import 'package:flutter/foundation.dart';

class RegisterParams {
  final String emailAddress;
  final String password;
  final String fullName;
  final String phoneNumber;

  RegisterParams({
    @required this.emailAddress,
    @required this.password,
    @required this.fullName,
    @required this.phoneNumber,
  });
}

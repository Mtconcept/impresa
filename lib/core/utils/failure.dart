import 'package:flutter/services.dart';

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

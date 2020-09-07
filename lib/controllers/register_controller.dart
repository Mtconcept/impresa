import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impresa/views/screens/home.dart';
import '../core/utils/validation_mixin.dart';
import '../views/screens/login_screen.dart';

class RegisterController extends GetxController with ValidationMixin {
  String fullName;
  String email;
  String phoneNumber;
  String password;
  var user;
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer login;
  final auth = FirebaseAuth.instance;
  final databaseReference = FirebaseFirestore.instance;

  @override
  void onInit() {
    login = TapGestureRecognizer()
      ..onTap = () {
        Get.off(LoginScreen());
      };
    super.onInit();
  }

  void validateForm() {
    formKey.currentState.validate();
  }

  void registerUser() async {
    validateForm();
    user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user);
    if (user == null) {
      Get.rawSnackbar(title: 'Can\'t create user', isDismissible: true);
    } else {
      Get.dialog(Text('Creating User'));
      Future.delayed(Duration(milliseconds: 3000));
      Get.back();
      createUser();
      Get.to(Home());
    }
  }

  void createUser() async {
    User user = auth.currentUser;
    databaseReference
        .collection('users')
        .doc(user.uid)
        .set({'fullname': fullName, 'phone': phoneNumber});
  }
}

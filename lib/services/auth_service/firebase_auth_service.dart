import 'package:firebase_auth/firebase_auth.dart';
import 'package:impresa/core/utils/failure.dart';

import '../../models/app_user.dart';
import '../../models/register_params.dart';
import '../database/firebase_firestore_service.dart';
import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final auth = FirebaseAuth.instance;

  Future<AppUser> register(RegisterParams params) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      String userId = userCredential.user.uid;
      return await FirebaseFirestoreService().createUserWithId(
        userId,
        fullName: params.fullName,
        phoneNumber: params.phoneNumber,
        emailAddress: params.emailAddress,
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'email-already-in-use') {
        throw Failure('Email Address is Already Registered');
      } else if (ex.code == 'operation-not-allowed') {
        throw Failure('Something went wrong');
      } else if (ex.code == 'weak-password') {
        throw Failure('Password is not strong enough');
      }
      return null;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/failure.dart';
import '../../models/app_user.dart';
import '../../models/login_params.dart';
import '../../models/register_params.dart';
import '../database/firebase_firestore_service.dart';
import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  AppUser get user {
    User user = _auth.currentUser;
    return AppUser.fromAuth(user);
  }

  @override
  Future<AppUser> register(RegisterParams params) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      String userId = userCredential.user.uid;
      await FirebaseFirestoreService().createUserWithId(
        userId,
        fullName: params.fullName,
        phoneNumber: params.phoneNumber,
        emailAddress: params.emailAddress,
      );
      return AppUser.fromAuth(userCredential.user);
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

  @override
  Future<AppUser> login(LoginParams params) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );
      return AppUser.fromAuth(userCredential.user);
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-disabled') {
        throw Failure('User has been disabled');
      } else if (ex.code == 'operation-not-allowed') {
        throw Failure('Something went wrong');
      } else if (ex.code == 'user-not-found' || ex.code == 'wrong-password') {
        throw Failure('Incorrect Email or Password');
      }
      return null;
    }
  }

  @override
  Future<AppUser> loginAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return AppUser.fromAuth(userCredential.user);
    } on FirebaseAuthException {
      throw Failure('Something went wrong');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException {
      throw Failure('Something went wrong');
    }
  }
}

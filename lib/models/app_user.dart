import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String id;
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final bool isAnonymous;

  AppUser({
    this.id,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.isAnonymous,
  });

  factory AppUser.fromAuth(User user) => AppUser(
        id: user.uid,
        isAnonymous: user.isAnonymous,
      );

  factory AppUser.fromDocumentSnapshot(DocumentSnapshot snapshot) => AppUser(
        id: snapshot.id,
        fullName: snapshot.data()['fullName'] ?? '',
        emailAddress: snapshot.data()['emailAddress'] ?? '',
        phoneNumber: snapshot.data()['phoneNumber'] ?? '',
      );
}

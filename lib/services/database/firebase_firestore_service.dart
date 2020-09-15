import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/app_user.dart';
import 'database.dart';

class FirebaseFirestoreService implements Database {
  final userCollection = FirebaseFirestore.instance.collection('users');

  AppUser _userDataFromSnapshot(DocumentSnapshot snapshot) => AppUser(
        id: snapshot.id,
        fullName: snapshot.data()['fullName'],
        emailAddress: snapshot.data()['emailAddress'],
        phoneNumber: snapshot.data()['phoneNumber'],
      );

  Future<AppUser> getUserWithId(String userId) async {
    final snapshot = await userCollection.doc(userId).get();
    return _userDataFromSnapshot(snapshot);
  }

  Future<AppUser> createUserWithId(String userId,
      {String emailAddress, String fullName, String phoneNumber}) async {
    await userCollection.doc(userId).set({
      'emailAddress': emailAddress,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    });
    return getUserWithId(userId);
  }
}

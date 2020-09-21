import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/app_user.dart';
import 'database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  final userCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<AppUser> getUserWithId(String userId) async {
    final snapshot = await userCollection.doc(userId).get();
    return AppUser.fromDocumentSnapshot(snapshot);
  }

  @override
  Future<void> createUserWithId(String userId,
      {String emailAddress, String fullName, String phoneNumber}) async {
    return await userCollection.doc(userId).set({
      'emailAddress': emailAddress,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    });
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/app_user.dart';
import '../../models/card_info.dart';
import '../../models/card_params.dart';
import 'database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<String> _uploadLogo(File file, String brandName) async {
    final storageReference =
        FirebaseStorage.instance.ref().child('${DateTime.now()}-$brandName');

    StorageUploadTask uploadTask = storageReference.putFile(file);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String url;

    if (snapshot != null) {
      url = await storageReference.getDownloadURL();
    }

    return url;
  }

  @override
  Future<String> uploadLogoForAnonymousUser(File file) async {
    final storageReference =
        FirebaseStorage.instance.ref().child('${DateTime.now()}-anon');

    StorageUploadTask uploadTask = storageReference.putFile(file);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String url;

    if (snapshot != null) {
      url = await storageReference.getDownloadURL();
    }

    return url;
  }

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

  @override
  Future<CardInfo> addCardInfo(CardParams params) async {
    String logoUrl = await _uploadLogo(params.logoImage, params.brandName);

    DocumentReference reference =
        await userCollection.doc(params.userId).collection("cards").add({
      'brandName': params.brandName,
      'fullName': params.fullName,
      'address': params.address,
      'emailAddress': params.emailAddress,
      'jobPosition': params.jobPosition,
      'logoUrl': logoUrl,
      'phoneNumber': params.phoneNumber,
      'socialOrWebLink': params.socialOrWebLink,
      'tagline': params.tagline,
    });
    DocumentSnapshot snapshot = await reference.get();

    return CardInfo.fromDocumentSnapshot(snapshot);
  }
}

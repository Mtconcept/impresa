import 'dart:io';

import 'package:impresa/models/card_params.dart';

import '../../models/app_user.dart';
import '../../models/card_info.dart';

abstract class DatabaseService {
  Future<String> uploadLogoForAnonymousUser(File file);

  Future<AppUser> getUserWithId(String userId);

  Future<void> createUserWithId(String userId,
      {String emailAddress, String fullName, String phoneNumber});

  Future<CardInfo> addCardInfo(CardParams params);
}

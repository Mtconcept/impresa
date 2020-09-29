import 'dart:io';

import '../../models/app_user.dart';
import '../../models/card_info.dart';

abstract class DatabaseService {
  Future<AppUser> getUserWithId(String userId);

  Future<void> createUserWithId(String userId,
      {String emailAddress, String fullName, String phoneNumber});

  Future<CardInfo> addCardInfo(String userId,
      {File logoImage, CardInfo cardInfo});
}

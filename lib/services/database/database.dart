import '../../models/app_user.dart';

abstract class Database {
  Future<AppUser> createUserWithId(String userId,
      {String emailAddress, String fullName, String phoneNumber});
}

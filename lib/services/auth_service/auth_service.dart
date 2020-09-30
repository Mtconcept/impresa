import '../../models/app_user.dart';
import '../../models/login_params.dart';
import '../../models/register_params.dart';

abstract class AuthService {
  AppUser get user;

  Future<AppUser> register(RegisterParams params);

  Future<AppUser> login(LoginParams params);

  Future<AppUser> loginAnonymously();

  Future<void> signOut();
}

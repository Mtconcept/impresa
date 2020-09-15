import '../../models/app_user.dart';
import '../../models/register_params.dart';

abstract class AuthService {
  Future<AppUser> register(RegisterParams params);
}

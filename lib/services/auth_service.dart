import 'package:space_rental_booking/models/user_role.dart';

class AuthService {
  UserRole? _activeRole;

  UserRole? get activeRole => _activeRole;

  Future<UserRole> signInAs(UserRole role) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    _activeRole = role;
    return role;
  }

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    _activeRole = null;
  }
}

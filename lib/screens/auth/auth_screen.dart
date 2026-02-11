import 'package:flutter/material.dart';
import 'package:space_rental_booking/models/user_role.dart';
import 'package:space_rental_booking/services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _authService = AuthService();
  String _status = 'Not signed in';

  Future<void> _signIn(UserRole role) async {
    final activeRole = await _authService.signInAs(role);
    if (!mounted) return;
    setState(() => _status = 'Signed in as ${activeRole.name}');
  }

  Future<void> _signOut() async {
    await _authService.signOut();
    if (!mounted) return;
    setState(() => _status = 'Not signed in');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Authentication & Roles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Text(_status),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: () => _signIn(UserRole.renter),
                  icon: const Icon(Icons.person_search),
                  label: const Text('Continue as Renter'),
                ),
                FilledButton.icon(
                  onPressed: () => _signIn(UserRole.owner),
                  icon: const Icon(Icons.home_work_outlined),
                  label: const Text('Continue as Owner'),
                ),
                OutlinedButton.icon(
                  onPressed: _signOut,
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign out'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Card(
              child: ListTile(
                title: Text('Production recommendation'),
                subtitle: Text('Integrate Firebase Auth or OAuth + JWT sessions with role claims persisted server-side.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

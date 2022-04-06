import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
    (ref) => AuthenticationService(FirebaseAuth.instance));

class AuthenticationService {
  AuthenticationService(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get userAuthenticationChanges => _firebaseAuth.userChanges();

  Future<void> signInAnonimously() async {
    await _firebaseAuth.signInAnonymously();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

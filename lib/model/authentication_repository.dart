import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
    (ref) => AuthenticationRepository(ref.read));

abstract class BaseAuthenticationRepository {
  Stream<User?> get userAuthenticationChanges;
  User? getCurrentUser();
  Future<void> signInAnonimously();
  Future<void> signOut();
}

class AuthenticationRepository implements BaseAuthenticationRepository {
  final Reader _reader;

  AuthenticationRepository(this._reader);

  @override
  Stream<User?> get userAuthenticationChanges =>
      _reader(firebaseAuthProvider).userChanges();

  @override
  Future<void> signInAnonimously() async {
    await _reader(firebaseAuthProvider).signInAnonymously();
  }

  @override
  User? getCurrentUser() {
    return _reader(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> signOut() async {
    await _reader(firebaseAuthProvider).signOut();
  }
}

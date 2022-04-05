import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/model/authentication_repository.dart';
import 'package:riverpod_course/objects/user_model.dart';

final authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, UserModel?>(
  (ref) => AuthenticationController(ref),
);

class AuthenticationController extends StateNotifier<UserModel?> {
  final Ref _ref;

  AuthenticationController(this._ref) : super(null) {
    _authenticationChangesSubscription?.cancel();
    _authenticationChangesSubscription = _ref
        .read(authenticationRepositoryProvider)
        .userAuthenticationChanges
        .listen((user) {
      if (user == null) {
        state = null;
      } else {
        state = UserModel(user.uid, UserAuthenticationState.complete);
      }
    });
  }

  StreamSubscription<User?>? _authenticationChangesSubscription;

  void signInAnonimously() async {
    await _ref.read(authenticationRepositoryProvider).signInAnonimously();
  }

  void signOut() async {
    await _ref.read(authenticationRepositoryProvider).signOut();
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/model/authentication_service.dart';
import 'package:riverpod_course/objects/user_model.dart';
import 'package:riverpod_course/viewmodel/userrepository_controller.dart';

final authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, UserModel?>(
  (ref) => AuthenticationController(ref),
);

class AuthenticationController extends StateNotifier<UserModel?> {
  final Ref _ref;

  AuthenticationController(this._ref) : super(null) {
    _authenticationChangesSubscription?.cancel();

    _authenticationChangesSubscription = _ref
        .read(authenticationServiceProvider)
        .userAuthenticationChanges
        .listen((user) async {
      if (user == null) {
        _currentUserChangesSubscription?.cancel();
        state = null;
      } else {
        _currentUserChangesSubscription = _ref
            .read(userRepositoryControllerProvider)
            .getUserStream(user.uid)
            .listen((currentUser) {
          state = currentUser;
        });
      }
    });
  }

  StreamSubscription<User?>? _authenticationChangesSubscription;
  StreamSubscription<UserModel>? _currentUserChangesSubscription;

  void signInAnonimously() async {
    await _ref.read(authenticationServiceProvider).signInAnonimously();
    String currentUid =
        _ref.read(authenticationServiceProvider).getCurrentUser()!.uid;
    await _ref
        .read(userRepositoryControllerProvider)
        .addUser(UserModel(currentUid, UserCompletionState.incomplete));
  }

  void signOut() async {
    await _ref.read(authenticationServiceProvider).signOut();
  }
}

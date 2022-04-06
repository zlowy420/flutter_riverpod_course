import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_course/objects/user_model.dart';
import 'package:riverpod_course/view/home_screen.dart';
import 'package:riverpod_course/view/profilecreation_screen.dart';
import 'package:riverpod_course/view/authentication_screen.dart';
import 'package:riverpod_course/viewmodel/authentication_controller.dart';

class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel? currentUser = ref.watch(authenticationControllerProvider);

    if (currentUser == null) {
      return SimpleLogin();
    } else if (currentUser.userCompletionState ==
        UserCompletionState.incomplete) {
      return ProfileCreationScreen();
    } else {
      return HomeScreen();
    }
  }
}

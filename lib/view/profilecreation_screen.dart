import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/viewmodel/authentication_controller.dart';
import 'package:riverpod_course/viewmodel/userrepository_controller.dart';
import 'package:riverpod_course/objects/user_model.dart';

class ProfileCreationScreen extends ConsumerWidget {
  const ProfileCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.golf_course),
          onPressed: () {
            UserModel? currentUser =
                ref.watch(authenticationControllerProvider);
            currentUser!.userCompletionState = UserCompletionState.complete;
            ref.watch(userRepositoryControllerProvider).updateUser(currentUser);
          },
        ),
      ),
    );
  }
}

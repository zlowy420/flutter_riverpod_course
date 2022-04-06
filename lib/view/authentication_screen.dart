import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/model/authentication_service.dart';
import 'package:riverpod_course/viewmodel/authentication_controller.dart';

class SimpleLogin extends ConsumerWidget {
  const SimpleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            ref
                .watch(authenticationControllerProvider.notifier)
                .signInAnonimously();
          },
          icon: const Icon(Icons.adb),
        ),
      ),
    );
  }
}

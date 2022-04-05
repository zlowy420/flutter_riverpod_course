import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/viewmodel/authentication_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                ref.watch(authenticationControllerProvider.notifier).signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("home!"),
      ),
    );
  }
}

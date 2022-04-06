import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_course/objects/user_model.dart';
import 'package:riverpod_course/view/home_screen.dart';
import 'package:riverpod_course/view/profilecreation_screen.dart';
import 'package:riverpod_course/view/authentication_screen.dart';
import 'package:riverpod_course/viewmodel/authentication_controller.dart';

class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  //  Notice here we aren't using stateless/statefull widget. Instead we are using
  //  a custom widget that is a consumer of the state.
  //  So if any data changes in the state, the widget will be updated.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel? currentUser = ref.watch(authenticationControllerProvider);

    if (currentUser == null) {
      return SimpleLogin();
    } else if (currentUser.userAuthenticationState ==
        UserAuthenticationState.complete) {
      return HomeScreen();
    } else if (currentUser.userAuthenticationState ==
        UserAuthenticationState.incomplete) {
      return ProfileCreationScreen();
    }
    return Container();
    //  now the build method takes a new paramaeter ScopeReader.
    //  this object will be used to access the provider.

    //  now the following variable contains an asyncValue so now we can use .when method
    //  to imply the condition
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:centralcaremobile/pages/home/home_page.dart';
import 'package:centralcaremobile/store/auth/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../pages/signIn/sign_in_page.dart';

class Auth extends StatelessWidget {
  final AuthStore authStore = GetIt.I<AuthStore>();

  Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authStore.fetchUser();
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }
}

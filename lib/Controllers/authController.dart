import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/providerState.dart';

class AuthController {
  void signUpController(
      String email, String password, String name, BuildContext context) async {
    ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    try {
      if (await providerState.signUp(email, password, name)) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      // SnackBar(content: Text('Something went wrong'));
      log(e.toString());
    }
  }

  void signInController(
      String email, String password, BuildContext context) async {
    ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    try {
      if (await providerState.signIn(email, password)) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // SnackBar(content: Text('Something went wrong'));
      log(e.toString());
    }
  }

  void signOutController(BuildContext context) {
    ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    providerState.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

}

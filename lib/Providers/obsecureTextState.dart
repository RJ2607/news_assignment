import 'package:flutter/material.dart';

class ObsecureTextState with ChangeNotifier {
  bool _obsecureText = true;
  Icon get icon => _obsecureText
      ? const Icon(Icons.visibility_off, color: Colors.grey)
      : const Icon(Icons.visibility, color: Colors.grey);

  bool get obsecureText => _obsecureText;

  void toggleObsecureText() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';

class ForgotPasswordNotifier extends ChangeNotifier {
  late String email;
  late int token;

  String get emailProvider => email;
  int get tokenProvider => token;

  void setEmailToken(String getEmail, int getToken) {
    email = getEmail;
    token = getToken;
    notifyListeners();
  }
}

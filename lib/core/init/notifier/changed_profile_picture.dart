import 'package:flutter/cupertino.dart';

class ChangedProfileHomeNotifier extends ChangeNotifier {
  String? imageProfileUrl;

  void changedProfileNotifier(String imageUrl) {
    imageProfileUrl = imageUrl;
    notifyListeners();
  }
}

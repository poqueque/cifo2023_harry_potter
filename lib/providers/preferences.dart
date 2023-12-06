import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  SharedPreferences? preferences;
  bool showSubtitles = false;

  Preferences() {
    init();
  }

  init() async {
    preferences = await SharedPreferences.getInstance();
    showSubtitles = preferences!.getBool('showSubtitles') ?? false;
    notifyListeners();
  }

  Future<void> setShowSubtitles(bool value) async {
    showSubtitles = value;
    notifyListeners();
    preferences ??= await SharedPreferences.getInstance();
    await preferences!.setBool('showSubtitles', value);
  }
}

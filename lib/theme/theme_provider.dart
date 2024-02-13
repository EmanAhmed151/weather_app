import 'package:flutter/material.dart';
import 'package:weather_app/theme/theme_pref.dart';


class ThemeProvider with ChangeNotifier{
  ThemePref themePref=ThemePref();
  bool _darkTheme=false;
  bool get getDarkTheme=>_darkTheme;
  set setDarkTheme(bool value){
    _darkTheme=value;
    themePref.setDarkTheme(value);
    notifyListeners();

  }
}
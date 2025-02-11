import 'package:chat_app/dark_mode.dart';
import 'package:chat_app/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  bool get isDarkModeEnabled => _themeData == darkMode;
  void updateThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData==lightMode){
      updateThemeData(darkMode);
    }else{
      updateThemeData(lightMode); 
    }
  }
}

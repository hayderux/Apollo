import 'package:flutter/material.dart';

enum MyThemeKeys { Theme1, Theme2, Theme3, Theme4, Theme5, Theme6 }

class Apptheme {
  static final ThemeData theme1 = ThemeData(
      //light theme
      platform: TargetPlatform.iOS,
      primaryColor: Color(0xff007ACC),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);

  static final ThemeData theme2 = ThemeData(
      platform: TargetPlatform.iOS,
      primaryColor: Colors.deepOrange.shade800,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);
  static final ThemeData theme3 = ThemeData(
      platform: TargetPlatform.iOS,
      primaryColor: Color(0xff825a2c),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);
  static final ThemeData theme4 = ThemeData(
      platform: TargetPlatform.iOS,
      primaryColor: Colors.purple.shade800,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);
  static final ThemeData theme5 = ThemeData(
      platform: TargetPlatform.iOS,
      primaryColor: Colors.red.shade800,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);
  static final ThemeData theme6 = ThemeData(
      platform: TargetPlatform.iOS,
      primaryColor: Colors.green.shade800,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent);
  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.Theme1:
        return theme1;
      case MyThemeKeys.Theme2:
        return theme2;
      case MyThemeKeys.Theme3:
        return theme3;
      case MyThemeKeys.Theme4:
        return theme4;
      case MyThemeKeys.Theme5:
        return theme5;
      case MyThemeKeys.Theme6:
        return theme6;
      default:
        return theme1;
    }
  }
}

import 'package:flutter/material.dart';

enum MyThemeKeys { Theme1, Theme2, Theme3, Theme4 }

class Apptheme {
  static final ThemeData theme1 = ThemeData(
    //light theme
    platform: TargetPlatform.iOS,
    primaryColor: Color(0xff007ACC),
  );

  static final ThemeData theme2 = ThemeData(
    platform: TargetPlatform.iOS,
    primaryColor: Colors.deepOrange.shade800,
  );
  static final ThemeData theme3 =
      ThemeData(platform: TargetPlatform.iOS, primaryColor: Color(0xff825a2c));
  static final ThemeData theme4 = ThemeData(
      platform: TargetPlatform.iOS, primaryColor: Colors.purple.shade800);

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
      default:
        return theme1;
    }
  }
}

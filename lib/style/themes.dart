import 'package:flutter/material.dart';

enum MyThemeKeys { Theme1, Theme2 }

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
  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.Theme1:
        return theme1;
      case MyThemeKeys.Theme2:
        return theme2;
      default:
        return theme1;
    }
  }
}

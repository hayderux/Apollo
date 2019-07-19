import 'package:apollo/style/themes.dart';
import 'package:flutter/material.dart';

class Themelist {
  String title;
  Color color;
  MyThemeKeys myThemeKeys;
  Themelist(this.title, this.color, this.myThemeKeys);
}

List<Themelist> choosetheme = [
  Themelist('Blue', Color(0xff007ACC), MyThemeKeys.Theme1),
  Themelist('Orange', Colors.deepOrange.shade800, MyThemeKeys.Theme2),
  Themelist('brown', Color(0xff825a2c), MyThemeKeys.Theme3),
  Themelist('brown', Colors.purple.shade800, MyThemeKeys.Theme4),
  Themelist('brown', Colors.red.shade800, MyThemeKeys.Theme5),
  Themelist('brown', Colors.green.shade800, MyThemeKeys.Theme6)
];

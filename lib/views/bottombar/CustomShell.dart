import 'package:flutter/material.dart';

class CustomShell {
  static borderRadius(context) {
    if (MediaQuery.of(context).size.width > 600) {
      return BorderRadius.circular(15);
    } else {
      return BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15));
    }
  }

  //BottomBar margin
  static margin(context) {
    if (MediaQuery.of(context).size.width > 600) {
      return EdgeInsets.only(left: 20, bottom: 20, right: 20);
    } else {
      EdgeInsets.only();
    }
  }
}


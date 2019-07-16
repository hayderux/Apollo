import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'style/CustomTheme.dart';
import 'style/themes.dart';

void main() async {
  _setTargetPlatformForDesktop();
  runApp(CustomTheme(
    initialThemeKey: MyThemeKeys.Theme1,
    child: MyApp(),
  ));
}

void _setTargetPlatformForDesktop({TargetPlatform target}) {
  TargetPlatform targetPlatform;
  if (target != null) {
    targetPlatform = target;
  } else if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

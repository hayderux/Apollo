import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';

class Settingslist {
  Settingslist({this.title, this.icon, this.ontap});

  String title;
  IconData icon;
  VoidCallback ontap;
}

List<Settingslist> settinglist = [
  Settingslist(
      title: 'System settings',
      icon: Icons.settings,
      ontap: () {
        LauncherAssist.launchApp('com.android.settings');
      })
];

import 'package:apollo/style/CustomTheme.dart';
import 'package:apollo/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final GlobalKey _menuKey = new GlobalKey();
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Scrollbar(
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text(
                  'Accent color',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: InkWell(
                  onTap: () {
                    dynamic state = _menuKey.currentState;
                    state.showButtonMenu();
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'System setting',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  LauncherAssist.launchApp('com.android.settings');
                },
              ),
            ],
          ),
        ));
  }
}

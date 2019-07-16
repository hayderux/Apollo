import 'package:apollo/components/search_bar.dart';
import 'package:apollo/views/settings/settings_list.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200.withOpacity(0.6),
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: SearchBar(),
          ),
        ),
        body: Scrollbar(
          child: ListView.builder(
            itemCount: settinglist.length,
            padding: EdgeInsets.only(top: 30),
            itemBuilder: (buildContext, index) {
              return ListTile(
                leading: Icon(
                  settinglist[index].icon,
                  color: Colors.black,
                ),
                title: Text(
                  settinglist[index].title,
                  style: TextStyle(fontSize: 18),
                ),
                onTap: settinglist[index].ontap,
              );
            },
          ),
        ));
  }
}

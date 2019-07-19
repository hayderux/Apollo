import 'package:apollo/style/CustomTheme.dart';
import 'package:apollo/style/themes.dart';
import 'package:apollo/views/settings/themelist.dart';
import 'package:flutter/material.dart';

class ColorChoose extends StatefulWidget {
  @override
  _ColorChooseState createState() => _ColorChooseState();
}

class _ColorChooseState extends State<ColorChoose> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      itemCount: choosetheme.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          child: CircleAvatar(
            backgroundColor: choosetheme[index].color,
            maxRadius: 20,
          ),
          onTap: () {
            _changeTheme(context, choosetheme[index].myThemeKeys);
          },
        );
      },
    );
  }
}

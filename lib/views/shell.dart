import 'dart:io';
import 'package:apollo/views/bottombar/bottombar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';


class Shell extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Shell> with TickerProviderStateMixin {
  var installedAppDetails;
  var wallpaper;
  @override
  void initState() {
    super.initState();
    loadNative();
  }

  void loadNative() async {
    LauncherAssist.getWallpaper().then((imageData) {
      setState(() {
        wallpaper = imageData;
      });
    });
    LauncherAssist.getAllApps().then((_appDetails) {
      setState(() {
        installedAppDetails = _appDetails;
      });
    });
  }

  loadWallpaper() {
    if (Platform.isAndroid) {
      return MemoryImage(wallpaper);
    }
    return AssetImage('assets/1.jpg');
  }

  getAppIcons() {
    List<Widget> appWidgets = [];
    for (var i = 0; i < installedAppDetails.length; i++) {
      var label = new Text(installedAppDetails[i]["label"],
          style: new TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center);
      var labelContainer = new Container(
          decoration: new BoxDecoration(
              //color: Colors.black54,
              //borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
              ),
          child: label,
          padding: new EdgeInsets.all(4.0),
          margin: new EdgeInsets.only(top: 4.0));
      var icon = new Image.memory(installedAppDetails[i]["icon"],
          fit: BoxFit.scaleDown, width: 50.0, height: 50.0);
      appWidgets.add(new GestureDetector(
          onTap: () {
            launchApp(installedAppDetails[i]["package"]);
          },
          child: new GridTile(
              child: new Column(children: <Widget>[icon, labelContainer]))));
    }
    return appWidgets;
  }

  void launchApp(String packageName) {
    LauncherAssist.launchApp(packageName);
  }

  @override
  Widget build(BuildContext context) {
    if (installedAppDetails != null) {
      List<Widget> appWidgets = getAppIcons();
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: loadWallpaper(), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            bottomNavigationBar: MyBottomBar(
              loadapps: appWidgets,
              favapps: <Widget>[],
            )),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: loadWallpaper(), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            bottomNavigationBar: MyBottomBar(
              loadapps: [],
              favapps: <Widget>[],
            )),
      );
    }
  }
}

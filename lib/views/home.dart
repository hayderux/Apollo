import 'package:apollo/style/xd.dart' as prefix0;
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launcher_assist/launcher_assist.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var wallpaper;
  List<Application> apps = List<Application>();
  @override
  void initState() {
    super.initState();
    /*LauncherAssist.getWallpaper().then((imageData) {
      setState(() {
        wallpaper = imageData;
      });
    });
    getApps();*/
  }

  void getApps() async {
    apps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        includeSystemApps: true,
        onlyAppsWithLaunchIntent: true);
    setState(() {
      apps = apps;
    });
  }

  Widget appContainer(BuildContext context, int index) {
    ApplicationWithIcon app = apps[index];

    return InkWell(
      onTap: () => DeviceApps.openApp(app.packageName),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200.withOpacity(0.4)),
            child: Image.memory(
              app.icon,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        /*body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.4,
              crossAxisSpacing: 1.4,
              mainAxisSpacing: 1.4),
          scrollDirection: Axis.horizontal,
          itemCount: apps.length,
          itemBuilder: appContainer,
        ),*/
        bottomNavigationBar: Container(
          height: 80,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.4),
            boxShadow: prefix0.boxShadow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: Center(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.windows),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

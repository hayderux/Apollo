import 'package:apollo/style/CustomTheme.dart';
import 'package:apollo/style/themes.dart';
import 'package:apollo/style/xd.dart';
import 'package:apollo/views/settings/themelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:screen/screen.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/services.dart';

class ControlCenter extends StatefulWidget {
  @override
  _ControlCenterState createState() => _ControlCenterState();
}

class _ControlCenterState extends State<ControlCenter>
    with TickerProviderStateMixin {
  bool _isEnabled = false;
  double _sliderValue;
  TabController controller;

  Widget circleicon(
      Color color, IconData icon, Color iconcolor, VoidCallback ontap) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: color, shape: BoxShape.circle, boxShadow: boxShadow),
        child: Icon(
          icon,
          color: iconcolor,
        ),
      ),
      onTap: ontap,
    );
  }

  isEnabled() async {
    bool isEnabled;
    try {
      isEnabled = await WiFiForIoTPlugin.isEnabled();
    } on PlatformException {
      isEnabled = false;
    }
    if (!mounted) return;

    setState(() {
      _isEnabled = isEnabled;
    });
  }

  Widget cheackwifi() {
    isEnabled();
    if (_isEnabled != null && _isEnabled) {
      return circleicon(
          Theme.of(context).primaryColor, Icons.wifi, Colors.white, () {
        WiFiForIoTPlugin.setEnabled(false);
      });
    }
    return circleicon(Colors.white, Icons.wifi, Colors.black, () {
      WiFiForIoTPlugin.setEnabled(true);
    });
  }

  changeappbarbutton() {
    if (controller.index != 0) {
      return IconButton(
        icon: Icon(Icons.dashboard),
        onPressed: () {
          controller.animateTo(0);
        },
      );
    } else {
      IconButton(
        icon: Icon(Icons.color_lens),
        onPressed: () {
          controller.animateTo(1);
        },
      );
    }
    return IconButton(
      icon: Icon(Icons.color_lens),
      onPressed: () {
        controller.animateTo(1);
      },
    );
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  void initState() {
    super.initState();
    getbrightness();
    controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  getbrightness() async {
    double brightness = await Screen.brightness;

    setState(() {
      _sliderValue = brightness;
    });
  }

  width() {
    if (MediaQuery.of(context).size.width > 600) {
      return MediaQuery.of(context).size.width / 2.7;
    } else {
      return MediaQuery.of(context).size.width / 1.3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: AssetImage('assets/faces/32.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'HAYDER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  changeappbarbutton(),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      LauncherAssist.launchApp('com.android.settings');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Container(
              child: ListView(
                padding: EdgeInsets.only(top: 30),
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      cheackwifi(),
                      circleicon(Theme.of(context).primaryColor,
                          Icons.network_cell, Colors.white, () {}),
                      circleicon(Colors.white, FontAwesomeIcons.moon,
                          Colors.black, () {}),
                      circleicon(
                          Colors.white, Icons.location_on, Colors.black, () {}),
                      circleicon(Theme.of(context).primaryColor,
                          Icons.screen_lock_rotation, Colors.white, () {})
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.volume_up),
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 0),
                        width: width(),
                        child: CupertinoSlider(
                            activeColor: Colors.white,
                            value: _sliderValue,
                            onChanged: (double b) {
                              setState(() {
                                _sliderValue = b;
                              });
                              Screen.setBrightness(b);
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.brightness_auto),
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 0),
                        width: width(),
                        child: CupertinoSlider(
                            activeColor: Colors.white,
                            value: _sliderValue,
                            onChanged: (double b) {
                              setState(() {
                                _sliderValue = b;
                              });
                              Screen.setBrightness(b);
                            }),
                      ),
                      SizedBox()
                    ],
                  )
                ],
              ),
            ),
            GridView.builder(
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
                    controller.animateTo(0);
                  },
                );
              },
            )
          ],
        ));
  }
}

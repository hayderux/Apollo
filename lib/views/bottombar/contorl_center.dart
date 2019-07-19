import 'package:apollo/style/CustomTheme.dart';
import 'package:apollo/style/themes.dart';
import 'package:apollo/style/xd.dart';
import 'package:apollo/style/xd.dart' as prefix0;
import 'package:apollo/views/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen/screen.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/services.dart';

import 'CustomShell.dart';

class ControlCenter extends StatefulWidget {
  @override
  _ControlCenterState createState() => _ControlCenterState();
}

class _ControlCenterState extends State<ControlCenter> {
  bool _isEnabled = false;
  double _sliderValue;
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

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

  @override
  void initState() {
    super.initState();
    getbrightness();
  }

  getbrightness() async {
    double brightness = await Screen.brightness;

    setState(() {
      _sliderValue = brightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Row(
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
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: CustomShell.borderRadius(context)),
                          backgroundColor:
                              Colors.grey.shade200.withOpacity(0.6),
                          context: context,
                          //barrierDismissible: true,
                          builder: (buildContext) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 20, right: 20, left: 20),
                              child: SettingsView(),
                            );
                          });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.color_lens),
                    onPressed: () {
                      _changeTheme(context, MyThemeKeys.Theme2);
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              cheackwifi(),
              circleicon(Colors.white, Icons.network_cell, Colors.black, () {}),
              circleicon(
                  Colors.white, FontAwesomeIcons.moon, Colors.black, () {}),
              circleicon(Colors.white, Icons.location_on, Colors.black, () {}),
              circleicon(
                  Colors.white, Icons.screen_lock_rotation, Colors.black, () {})
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.volume_up),
              Container(
                margin: EdgeInsets.only(left: 20, right: 0),
                width: MediaQuery.of(context).size.width / 1.3,
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
                margin: EdgeInsets.only(left: 20, right: 0),
                width: MediaQuery.of(context).size.width / 1.3,
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
    );
  }
}

import 'package:apollo/style/xd.dart';
import 'package:apollo/views/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/services.dart';

class ControlCenter extends StatefulWidget {
  @override
  _ControlCenterState createState() => _ControlCenterState();
}

class _ControlCenterState extends State<ControlCenter> {
  bool _isEnabled = false;
  final double dogAvatarSize = 150.0;
  // This is the starting value of the slider.
  double _sliderValue = 10.0;
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
      return circleicon(Color(0xff0063B1), Icons.wifi, Colors.white, () {
        WiFiForIoTPlugin.setEnabled(false);
      });
    }
    return circleicon(Colors.white, Icons.wifi, Colors.black, () {
      WiFiForIoTPlugin.setEnabled(true);
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
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (buildContext) {
                            return SettingsView();
                          });
                    },
                  ),
                  /*IconButton(
                    icon: Icon(Icons.power_settings_new),
                    onPressed: () {},
                  ),*/
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
              Slider(
                activeColor: Colors.white,
                value: 40,
                min: 1,
                max: 60,
                divisions: 2,
                label: _sliderValue.toString(),
                onChanged: (onchanged) {
                  print('object');
                },
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.brightness_auto),
              Slider(
                activeColor: Colors.white,
                value: 100,
                min: 60,
                max: 100,
                divisions: 1,
                label: 'Volume',
                onChanged: (onchanged2) {
                  print('object');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

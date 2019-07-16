import 'package:apollo/style/CustomTheme.dart';
import 'package:apollo/style/themes.dart';
import 'package:apollo/style/xd.dart';
import 'package:apollo/views/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screen/screen.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/services.dart';

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
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (buildContext) {
                            return SettingsView();
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
              Slider(
                activeColor: Colors.white,
                value: _sliderValue,
                min: 0,
                inactiveColor: Colors.blue,
                max: 100.0,
                divisions: 2,
                onChanged: (onchanged) {
                  print('object');
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.brightness_auto),
              SliderTheme(
                data: SliderThemeData(
                    trackHeight: 50,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                    tickMarkShape:
                        RoundSliderTickMarkShape(tickMarkRadius: 50)),
                child: Slider(
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

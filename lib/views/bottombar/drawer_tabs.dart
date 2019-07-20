import 'package:apollo/style/xd.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class Drawerbar extends StatelessWidget {
  final TabController controllerx;

  const Drawerbar({Key key, this.controllerx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: boxShadow),
        margin: EdgeInsets.only(
          top: 0,
        ),
        width: 350,
        child: TabBar(
          indicatorColor: Colors.transparent,
          controller: controllerx,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontFamily: 'sf'),
          unselectedLabelColor: Colors.grey.shade400,
          indicator: new BubbleTabIndicator(
            indicatorRadius: 10,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: <Widget>[
            Tab(
              text: 'Notifications',
            ),
            Tab(
              text: 'Timeline',
            ),
          ],
        ),
      ),
    );
  }
}

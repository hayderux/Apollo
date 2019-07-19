import 'package:apollo/components/search_bar.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final TabController controller;
  final List<Widget> loadapps;
  const DrawerPage({Key key, this.controller, this.loadapps}) : super(key: key);
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  girdviewbreakpoint() {
    if (MediaQuery.of(context).size.width > 600) {
      return GridView.count(
          padding: EdgeInsets.only(top: 30),
          crossAxisCount: 8,
          childAspectRatio: 1.0,
          crossAxisSpacing: 1.4,
          mainAxisSpacing: 1.4,
          children: widget.loadapps);
    } else {
      return GridView.count(
          padding: EdgeInsets.only(top: 25),
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          crossAxisSpacing: 1.4,
          mainAxisSpacing: 1.4,
          children: widget.loadapps);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SearchBar(),
          /*child: Drawerbar(
            controllerx: widget.controller,
          ),*/
        ),
        body: TabBarView(
          controller: widget.controller,
          children: <Widget>[
            Scrollbar(child: girdviewbreakpoint()),
            Container()
          ],
        ),
      ),
    );
  }
}

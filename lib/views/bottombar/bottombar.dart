import 'package:apollo/components/Vertical_divider.dart';
import 'package:apollo/components/c_dialog.dart';
import 'package:apollo/components/custom_sheet.dart';
import 'package:apollo/style/xd.dart';
import 'package:apollo/views/bottombar/contorl_center.dart';
import 'package:apollo/views/bottombar/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CustomShell.dart';

class MyBottomBar extends StatefulWidget {
  final List<Widget> favapps;
  final List<Widget> loadapps;
  const MyBottomBar({Key key, this.favapps, this.loadapps}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: CustomShell.margin(context),
      decoration: BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.5),
          boxShadow: boxShadow,
          borderRadius: CustomShell.borderRadius(context)),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.windows),
                    onPressed: () {
                      if (MediaQuery.of(context).size.width > 600) {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (buildContext) {
                              return DialogFork(
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    Colors.grey.shade200.withOpacity(0.6),
                                elevation: 6.0,
                                child: DrawerPage(
                                  controller: controller,
                                  loadapps: widget.loadapps,
                                ),
                              );
                            });
                      } else {
                        AppSheets.showAppHeightEightSheet(
                            context: context,
                            radius: 15,
                            bgColor: Colors.black.withOpacity(0.6),
                            color: Colors.grey.shade200.withOpacity(0.6),
                            builder: (buildContext) {
                              return DrawerPage(
                                controller: controller,
                                loadapps: widget.loadapps,
                              );
                            });
                      }
                    },
                  ),
                  VerticalDividerx(),
                ],
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: widget.favapps,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  VerticalDividerx(),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: AssetImage('assets/faces/32.jpg'),
                    ),
                    onTap: () {
                      if (MediaQuery.of(context).size.width < 600) {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            elevation: 6.0,
                            backgroundColor:
                                Colors.grey.shade200.withOpacity(0.6),
                            builder: (buildContext) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: ControlCenter(),
                              );
                            });
                      } else {
                        showDialogF(
                            context: context,
                            barrierDismissible: true,
                            builder: (buildContext) {
                              return DialogFork(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.bottomRight,
                                  elevation: 6.0,
                                  backgroundColor:
                                      Colors.grey.shade200.withOpacity(0.6),
                                  child: Container(
                                    height: 380,
                                    width: 450,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: ControlCenter(),
                                    ),
                                  ));
                            });
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:foods_order/size_config.dart';

import 'app_screen.dart';
import 'drawer.dart';

class Zooom extends StatefulWidget {
  @override
  _ZooomState createState() => _ZooomState();
}

class _ZooomState extends State<Zooom> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ZoomDrawer(
        style: DrawerStyle.DefaultStyle,
        mainScreenScale: 0.40,
        clipMainScreen: true,
        controller: _drawerController,
        menuScreen: MenuScreen(),
        mainScreen: AppScreen(drawerController: _drawerController),
        borderRadius: 24.0,
        showShadow: true,
        angle: -20,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * .5,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeInCirc,
      ),
    );
  }
}

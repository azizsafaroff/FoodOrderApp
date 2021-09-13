import 'package:flutter/material.dart';
import 'package:foods_order/screens/home/home_screen.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_navigation_bar.dart';

class AppScreen extends StatelessWidget {
  final drawerController;
  const AppScreen({Key? key, this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          HomeScreen(zoomDrawerController: drawerController),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomBottomnNavigationbar(),
          )
        ],
      ),
    );
  }
}

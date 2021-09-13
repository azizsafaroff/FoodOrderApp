import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final ZoomDrawerController? zoomDrawerController;

  const HomeScreen({Key? key, this.zoomDrawerController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        zoomDrawerController: zoomDrawerController,
      ),
    );
  }
}

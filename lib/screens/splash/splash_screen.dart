import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';

import 'components/body.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<OrderCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            action: false,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order Complete",
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(34.0),
                  ),
                ),
                SizedBox(
                  height: getProportionScreenHeight(50.0),
                ),
                Container(
                  height: getProportionScreenWidth(110.0),
                  width: getProportionScreenWidth(110.0),
                  child: Image.asset(
                    "assets/icons/korzin.png",
                  ),
                ),
                SizedBox(
                  height: getProportionScreenHeight(25.0),
                ),
                Text(
                  "Thank you for Ordering",
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(28.0),
                  ),
                ),
                SizedBox(
                  height: getProportionScreenHeight(10.0),
                ),
                Text(
                  "Your devliery will be in\nsoon.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(17.0),
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

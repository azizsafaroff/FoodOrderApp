import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class OfferPromoScreen extends StatefulWidget {
  const OfferPromoScreen({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<OfferPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            action: false,
          ),
          SizedBox(height: getProportionScreenHeight(40.0)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(50.0)),
            child: Text(
              "My offers",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: getProportionScreenWidth(34.0),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionScreenWidth(50.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ohh snap! No offers yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: getProportionScreenWidth(26.0)),
                  ),
                  Text(
                    "please check again.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(16.0),
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

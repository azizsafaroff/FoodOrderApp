import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/size_config.dart';

class OrderItem extends StatelessWidget {
  final Order? order;
  const OrderItem({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getProportionScreenWidth(50.0)),
      width: getProportionScreenWidth(220.0),
      height: getProportionScreenHeight(371.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: getProportionScreenHeight(45.0),
            left: getProportionScreenWidth(0.0),
            child: Container(
              width: getProportionScreenWidth(220.0),
              height: getProportionScreenHeight(361.0) -
                  getProportionScreenHeight(40.0),
              padding: EdgeInsets.symmetric(
                vertical: getProportionScreenHeight(40.0),
                horizontal: getProportionScreenWidth(40.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order!.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(22.0),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Text(
                    "N${order!.price}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionScreenWidth(17.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Center(
              child: Container(
                width: getProportionScreenWidth(160.0),
                height: getProportionScreenWidth(160.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(order!.image),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

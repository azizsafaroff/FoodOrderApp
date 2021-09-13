import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';

import '../order_complect.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionScreenWidth(50.0),
          ),
          child: Container(
            padding: EdgeInsets.only(bottom: getProportionScreenHeight(17.0)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: getProportionScreenHeight(17),
                    left: getProportionScreenWidth(46),
                    bottom: getProportionScreenHeight(19),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Please note",
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(20.0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: getProportionScreenHeight(18),
                    left: getProportionScreenWidth(46),
                    bottom: getProportionScreenHeight(19),
                    right: getProportionScreenWidth(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Delivery to trasaco",
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(18),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "GHS 2 - GH 3 ",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: getProportionScreenWidth(18),
                        ),
                      ),
                      SizedBox(height: getProportionScreenHeight(17)),
                      Divider(
                        thickness: 0.3,
                        color: Colors.black.withOpacity(0.5),
                        height: 0,
                      ),
                      SizedBox(height: getProportionScreenHeight(17)),
                      Text(
                        "Delivery to campus",
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(18),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "GHS 2 - GH 3 ",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: getProportionScreenWidth(18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionScreenHeight(34.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getProportionScreenWidth(82.0),
                      height: getProportionScreenHeight(60.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionScreenWidth(20.0)),
                    Container(
                      height: getProportionScreenHeight(60),
                      width: getProportionScreenWidth(159),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFA4A0C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () async {
                          if (Variables.cartList.isNotEmpty) {
                            final _order = await FirebaseFirestore.instance
                                .collection('order_collection')
                                .add({
                              "date": DateTime.now(),
                              "orderrs":
                                  FieldValue.arrayUnion(Variables.cartList),
                              "total": Variables.total,
                              "process": false,
                            });

                            Future.delayed(Duration(seconds: 10), () {
                              FirebaseFirestore.instance
                                  .collection('order_collection')
                                  .doc(_order.id)
                                  .update({
                                "process": true,
                              });
                            });

                            for (String id in Variables.cartList) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(Variables.authUser.currentUser!.uid)
                                  .update({
                                'cart_items': FieldValue.arrayRemove([id]),
                              });

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(Variables.authUser.currentUser!.uid)
                                  .update({
                                'order_items':
                                    FieldValue.arrayUnion([_order.id]),
                              });
                            }
                            Variables.cartList.clear();
                            Variables.total = 0;
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OrderCompleteScreen(),
                            ),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

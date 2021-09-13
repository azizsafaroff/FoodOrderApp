import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class CartItemScreen extends StatelessWidget {
  final id;
  CartItemScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(Variables.authUser.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshotUser) {
          if (snapshotUser.hasData) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: getProportionScreenWidth(105.0),
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .doc('foods')
                    .collection('foods')
                    .doc(id)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final Order _order = Order(
                      id: snapshot.data.id,
                      name: snapshot.data['name'],
                      price: snapshot.data['price'],
                      image: snapshot.data['image'],
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomAppBar(
                          action: true,
                          id: _order.id,
                          user: snapshotUser.data,
                        ),
                        SizedBox(height: getProportionScreenHeight(12.0)),
                        Container(
                          height: getProportionScreenWidth(240.0),
                          child: Container(
                            width: getProportionScreenWidth(240.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(_order.image),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(45.0)),
                        Text(
                          _order.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(28.0),
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(12.0)),
                        Text(
                          "GHS ${_order.price}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(22.0),
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(40.0)),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getProportionScreenWidth(40.0),
                            right: getProportionScreenWidth(40.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Delivery info",
                                style: TextStyle(
                                  fontSize: getProportionScreenWidth(20.0),
                                ),
                              ),
                              SizedBox(
                                  height: getProportionScreenHeight(7.0)),
                              Text(
                                "Delivered between monday aug and\nthursday 20 from 8pm to 91:32 pm",
                                style: TextStyle(
                                  fontSize: getProportionScreenWidth(18.0),
                                  letterSpacing: .08,
                                  color: Colors.black.withOpacity(.5),
                                  height: getProportionScreenHeight(1.8),
                                ),
                              ),
                              SizedBox(
                                  height: getProportionScreenHeight(44.0)),
                              Text(
                                "Return policy",
                                style: TextStyle(
                                  fontSize: getProportionScreenWidth(20.0),
                                ),
                              ),
                              SizedBox(
                                  height: getProportionScreenHeight(7.0)),
                              Text(
                                "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                                style: TextStyle(
                                  fontSize: getProportionScreenWidth(18.0),
                                  letterSpacing: .08,
                                  color: Colors.black.withOpacity(.5),
                                  height: getProportionScreenHeight(1.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

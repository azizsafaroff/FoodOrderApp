import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/screens/cart/cart_item_screen.dart';
import 'package:foods_order/size_config.dart';

class FavoriteOrderItem extends StatelessWidget {
  FavoriteOrderItem({Key? key, required this.id}) : super(key: key);

  final id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .doc('foods')
          .collection('foods')
          .doc(id)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final Order _order = Order(
            name: snapshot.data['name'],
            image: snapshot.data['image'],
            id: id,
            price: snapshot.data['price'],
          );
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartItemScreen(
                    id: id,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(24.0),
                vertical: getProportionScreenHeight(16.0),
              ),
              margin: EdgeInsets.only(
                bottom: getProportionScreenHeight(14.0),
              ),
              height: getProportionScreenHeight(120.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionScreenWidth(70.0),
                    height: getProportionScreenWidth(70.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(_order.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionScreenWidth(10.0)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _order.name,
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(17.0),
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "GHS ${_order.price}",
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(15.0),
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}

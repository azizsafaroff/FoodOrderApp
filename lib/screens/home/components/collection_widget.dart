import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/screens/details/order_screen.dart';
import 'package:foods_order/screens/other/see_more_screen.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/order_item_widget.dart';

class CollectionItemsWidget extends StatelessWidget {
  const CollectionItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .doc('foods')
          .collection('foods')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final _data = snapshot.data.docs;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: getProportionScreenWidth(40.0)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SeeMoreScreen()));
                    },
                    child: Text(
                      "see more",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionScreenWidth(15.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: getProportionScreenHeight(370.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final _item = _data[index];
                    final Order _order = Order(
                      id: _item.id,
                      name: _item['name'],
                      price: _item['price'],
                      image: _item['image'],
                    );
                    return GestureDetector(
                      child: OrderItem(
                        order: _order,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OrderScreen(
                              index: index,
                              data: _data,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}

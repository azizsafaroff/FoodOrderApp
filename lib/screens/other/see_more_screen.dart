import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/screens/details/order_screen.dart';
import 'package:foods_order/screens/search/components/search_order_item.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

// ignore: must_be_immutable
class SeeMoreScreen extends StatelessWidget {
  SeeMoreScreen({Key? key}) : super(key: key);

  final List _searchItems = [];
  List _dataItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            action: false,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .doc('foods')
                  .collection('foods')
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _dataItems = snapshot.data.docs;
                  return Padding(
                    padding:
                        EdgeInsets.only(top: getProportionScreenHeight(50)),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionScreenWidth(35.0),
                      ),
                      itemCount: _searchItems.length != 0
                          ? _searchItems.length
                          : _dataItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: getProportionScreenWidth(35.0),
                        mainAxisSpacing: getProportionScreenWidth(17.0),
                        mainAxisExtent: getProportionScreenHeight(300.0),
                      ),
                      itemBuilder: (context, index) {
                        final _item = _searchItems.length != 0
                            ? _searchItems[index]
                            : _dataItems[index];

                        final Order _order = Order(
                          id: _item.id,
                          name: _item.data()['name'],
                          price: _item.data()['price'],
                          image: _item.data()['image'],
                        );
                        return GestureDetector(
                          child: SearchOrderItem(
                            order: _order,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                  index: index,
                                  data: _dataItems,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

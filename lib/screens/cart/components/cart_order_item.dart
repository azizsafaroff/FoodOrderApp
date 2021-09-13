import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/screens/cart/cart_item_screen.dart';
import 'package:foods_order/size_config.dart';

class CartOrderItem extends StatefulWidget {
  CartOrderItem({Key? key, required this.id}) : super(key: key);

  final id;

  @override
  _CartOrderItemState createState() => _CartOrderItemState();
}

class _CartOrderItemState extends State<CartOrderItem> {
  final SlidableController _slidableController = SlidableController();
  int _count = 1;
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .doc('foods')
          .collection('foods')
          .doc(widget.id)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final Order _order = Order(
            name: snapshot.data['name'],
            image: snapshot.data['image'],
            id: widget.id,
            price: snapshot.data['price'],
          );
          if (!_added){
            Variables.total += _order.price as int;
          }
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            key: Key(widget.id),
            controller: _slidableController,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartItemScreen(
                      id: widget.id,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GHS ${_order.price}",
                                style: TextStyle(
                                  fontSize: getProportionScreenWidth(15.0),
                                  color: kPrimaryColor,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: getProportionScreenWidth(90.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionScreenWidth(8.0),
                                  vertical: getProportionScreenHeight(6.0),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: kPrimaryColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (_count != 0)
                                          setState(() {
                                            _count--;
                                          });

                                        Variables.total -= _order.price as int;
                                      },
                                      child: Icon(
                                        Icons.horizontal_rule,
                                        color: Colors.white,
                                        size: getProportionScreenWidth(15.0),
                                      ),
                                    ),
                                    SizedBox(
                                        width: getProportionScreenWidth(10.0)),
                                    Text(
                                      _count.toString(),
                                      style: TextStyle(
                                        fontSize:
                                            getProportionScreenWidth(15.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width: getProportionScreenWidth(10.0)),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _count++;
                                        });

                                        Variables.total += _order.price as int;
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: getProportionScreenWidth(15.0),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            secondaryActions: [
              Center(
                child: Container(
                  width: getProportionScreenWidth(45.0),
                  height: getProportionScreenWidth(45.0),
                  padding: EdgeInsets.all(getProportionScreenWidth(12.0)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryLightColor,
                  ),
                  child: ImageIcon(
                    AssetImage('assets/icons/favorite_icon.png'),
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: getProportionScreenWidth(45.0),
                  height: getProportionScreenWidth(45.0),
                  padding: EdgeInsets.all(getProportionScreenWidth(12.0)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryLightColor,
                  ),
                  child: ImageIcon(
                    AssetImage('assets/icons/trash_icon.png'),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (action) {
                Variables.trashList.add(widget.id);
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  final index;
  final data;
  const OrderScreen({Key? key, this.index, this.data}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  Order? _order;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.index);
    _pageIndex = widget.index;

    _pageController!.addListener(_pageListener);

    _order = Order(
      id: widget.data[_pageIndex].id,
      name: widget.data[_pageIndex]['name'],
      price: widget.data[_pageIndex]['price'],
      image: widget.data[_pageIndex]['image'],
    );
  }

  void _pageListener() {
    if (_pageController!.offset < 360.0 / 2) {
      _pageIndex = 0;
    } else if (_pageController!.offset <= 360.0 ||
        _pageController!.offset < 720.0 / 2.0 + 360.0 / 2.0) {
      _pageIndex = 1;
    } else if (_pageController!.offset <= 720.0 ||
        _pageController!.offset < 1080.0 / 2.0 + 720.0 / 2.0) {
      _pageIndex = 2;
    } else if (_pageController!.offset <= 1080.0) {
      _pageIndex = 3;
    }

    _order = Order(
      id: widget.data[_pageIndex].id,
      name: widget.data[_pageIndex]['name'],
      price: widget.data[_pageIndex]['price'],
      image: widget.data[_pageIndex]['image'],
    );

    setState(() {});
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListener);
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(Variables.authUser.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: getProportionScreenWidth(105.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomAppBar(
                        action: true,
                        id: _order!.id,
                        user: snapshot.data,
                      ),
                      Column(
                        children: [
                          SizedBox(height: getProportionScreenHeight(12.0)),
                        ],
                      ),
                      Container(
                        height: getProportionScreenWidth(240.0),
                        child: PageView.builder(
                          controller: _pageController,
                          physics: BouncingScrollPhysics(),
                          itemCount: widget.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: getProportionScreenWidth(240.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(_order!.image),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: getProportionScreenHeight(36.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.data.length,
                            (index) {
                              return Row(
                                children: [
                                  _circle(index: index),
                                  SizedBox(
                                      width: getProportionScreenWidth(10.0)),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionScreenHeight(45.0)),
                      Text(
                        _order!.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(28.0),
                        ),
                      ),
                      SizedBox(height: getProportionScreenHeight(12.0)),
                      Text(
                        "GHS ${_order!.price}",
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
                            SizedBox(height: getProportionScreenHeight(7.0)),
                            Text(
                              "Delivered between monday aug and\nthursday 20 from 8pm to 91:32 pm",
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(18.0),
                                letterSpacing: .08,
                                color: Colors.black.withOpacity(.5),
                                height: getProportionScreenHeight(1.8),
                              ),
                            ),
                            SizedBox(height: getProportionScreenHeight(44.0)),
                            Text(
                              "Return policy",
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(20.0),
                              ),
                            ),
                            SizedBox(height: getProportionScreenHeight(7.0)),
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
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getProportionScreenWidth(40.0),
                      right: getProportionScreenWidth(40.0),
                      bottom: getProportionScreenWidth(20.0),
                    ),
                    child: Container(
                      width: getProportionScreenWidth(314.0),
                      height: getProportionScreenHeight(70.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(Variables.authUser.currentUser!.uid)
                              .update({
                            'cart_items': FieldValue.arrayUnion([_order!.id]),
                          });
                        },
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(20.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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

  Icon _circle({index}) {
    final Color iconColor;
    if (index == _pageIndex) {
      iconColor = kPrimaryColor;
    } else {
      iconColor = Color(0xFFC4C4C4);
    }
    return Icon(
      Icons.circle,
      size: getProportionScreenWidth(10.0),
      color: iconColor,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/screens/cart/cart_screen.dart';
import 'package:foods_order/size_config.dart';

import 'foods_widget.dart';

class Body extends StatelessWidget {
  Body({Key? key, this.zoomDrawerController}) : super(key: key);

  final zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionScreenWidth(50.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionScreenHeight(70.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                zoomDrawerController!.open!();
                              },
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/menu.png",
                                ),
                                color: Colors.black,
                                size: getProportionScreenWidth(22.0),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                )
                                    .then((value) {
                                  if (Variables.trashList.isNotEmpty) {
                                    for (String id in Variables.trashList) {
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(Variables
                                              .authUser.currentUser!.uid)
                                          .update({
                                        'cart_items':
                                            FieldValue.arrayRemove([id]),
                                      });

                                      Variables.trashList.clear();
                                    }
                                  }
                                });
                              },
                              child: ImageIcon(
                                AssetImage("assets/icons/shopping-cart.png"),
                                color: Colors.grey.shade800,
                                size: getProportionScreenWidth(22.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(35.0),
                        ),
                        Text(
                          "Delicious\nfood for you",
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(34.0),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(28.0),
                        ),
                        Text(
                          "Hello ${Variables.authUser.currentUser!.email}",
                          style: TextStyle(
                            fontSize: getProportionScreenWidth(20.0),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        // Container(
                        //   height: getProportionScreenHeight(70.0),
                        //   padding: EdgeInsets.only(
                        //       left: getProportionScreenWidth(15.0),
                        //       top: getProportionScreenWidth(4.0)),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30.0),
                        //     color: Color(0xFFEFEEEE),
                        //   ),
                        //   child: TextField(
                        //     controller: _searchController,
                        //     decoration: InputDecoration(
                        //       hintText: "Search",
                        //       prefixIcon: Container(
                        //         padding: EdgeInsets.all(
                        //             getProportionScreenWidth(16.0)),
                        //         width: getProportionScreenWidth(18.0),
                        //         height: getProportionScreenWidth(18.0),
                        //         child: ImageIcon(
                        //           AssetImage('assets/icons/search_icon.png'),
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       border: InputBorder.none,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              toolbarHeight: 0.0,
              backgroundColor: Color.fromRGBO(242, 242, 242, 1),
              automaticallyImplyLeading: false,
              pinned: true,
              bottom: TabBar(
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                isScrollable: true,
                labelPadding: EdgeInsets.only(
                  left: getProportionScreenWidth(22.0),
                  right: getProportionScreenWidth(22.0),
                ),
                labelColor: Color.fromRGBO(250, 74, 12, 1),
                unselectedLabelColor: Color.fromRGBO(154, 154, 157, 1),
                indicatorColor: Color.fromRGBO(250, 74, 12, 1),
                indicatorWeight: 3.0,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                tabs: [
                  Tab(text: 'Foods'),
                  Tab(text: 'Drinks'),
                  Tab(text: 'Snacks'),
                  Tab(text: 'Sauce'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            FoodsWidget(),
            FoodsWidget(),
            FoodsWidget(),
            FoodsWidget(),
          ],
        ),
      ),
    );
  }
}

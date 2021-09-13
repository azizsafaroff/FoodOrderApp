import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/screens/details/order_screen.dart';
import 'package:foods_order/size_config.dart';

import 'components/search_order_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();

  bool _notFound = false;
  List _searchItems = [];
  List _dataItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: getProportionScreenHeight(50.0)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionScreenWidth(50.0),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: getProportionScreenWidth(16.0),
                  ),
                ),
                SizedBox(
                  width: getProportionScreenWidth(24.0),
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    cursorWidth: 1.0,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(17.0),
                    ),
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: getProportionScreenWidth(17.0)),
                      border: InputBorder.none,
                      hintText: "Search foods",
                    ),
                    onChanged: (text) {
                      _searchItems.clear();

                      if (_notFound){
                        setState(() {
                          _notFound = false;
                        });
                      }

                      for (var item in _dataItems) {
                        if (item['name']
                            .toString()
                            .toLowerCase()
                            .contains(text.toString().toLowerCase())) {
                          _searchItems.add(item);
                        }
                      }

                      if (_searchItems.length == 0) {
                        setState(() {
                          _notFound = true;
                        });
                      }

                      setState(() {});
                    },
                    onSubmitted: (text) {
                      if (_searchItems.length == 0) {
                        setState(() {
                          _notFound = true;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionScreenHeight(24.0),
          ),
          _notFound
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: getProportionScreenWidth(122.0),
                        width: getProportionScreenWidth(122.0),
                        child: ImageIcon(
                          AssetImage("assets/icons/search_big_icon.png"),
                          color: Color(0xFFC7C7C7),
                        ),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(38.0),
                      ),
                      Text(
                        "Item not found ",
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(28.0),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(16.0),
                      ),
                      Text(
                        "Try searching the item with\n a different keyword.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0),
                          color: Colors.black.withOpacity(.5),
                        ),
                      )
                    ],
                  ),
                )
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .doc('foods')
                      .collection('foods')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      _dataItems = snapshot.data.docs;
                      return Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionScreenWidth(35.0),
                          ),
                          itemCount: _searchItems.length != 0
                              ? _searchItems.length
                              : _dataItems.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              name: _item['name'],
                              price: _item['price'],
                              image: _item['image'],
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
        ],
      ),
    );
  }
}

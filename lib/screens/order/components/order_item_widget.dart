import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/order.dart';
import 'package:foods_order/size_config.dart';

class OrderItemWidget extends StatelessWidget {
  OrderItemWidget({Key? key, required this.datas, this.process, this.total})
      : super(key: key);
  final total;
  final process;
  final datas;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getProportionScreenWidth(24.0),
        right: getProportionScreenWidth(24.0),
        top: getProportionScreenHeight(24.0),
        bottom: getProportionScreenHeight(24.0),
      ),
      margin: EdgeInsets.only(
        bottom: getProportionScreenHeight(14.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          ...List.generate(datas.length, (index) => _item(id: datas[index])),
          SizedBox(height: getProportionScreenHeight(16.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: $total",
              ),
              Row(
                children: [
                  ImageIcon(
                    process
                        ? AssetImage('assets/icons/mini_complect_icon.png')
                        : AssetImage('assets/icons/history_icon.png'),
                    size: getProportionScreenWidth(20.0),
                  ),
                  SizedBox(width: getProportionScreenWidth(8.0)),
                  Text(
                    process
                        ? "Complected"
                        : "in processing...",
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(16.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item({id}) {
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
          return Container(
            margin: EdgeInsets.only(bottom: getProportionScreenHeight(16.0)),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: getProportionScreenHeight(10.0)),
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
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

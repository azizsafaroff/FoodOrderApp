import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

import 'components/no_order_widget.dart';
import 'components/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  final List _dates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomAppBar(
                  title: "Orders",
                  action: false,
                ),
                SizedBox(height: getProportionScreenHeight(24.0)),
              ],
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(Variables.authUser.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final _datas = snapshot.data['order_items'];
                return _datas.length != 0
                    ? SliverPadding(
                        padding: EdgeInsets.only(
                          left: getProportionScreenWidth(40.0),
                          right: getProportionScreenWidth(40.0),
                          bottom: getProportionScreenWidth(40.0),
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('order_collection')
                                    .doc(_datas[index])
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    final _datas = snapshot.data['orderrs'];
                                    final _date = DateFormat.yMMMd()
                                        .format(snapshot.data['date'].toDate())
                                        .toString();
                                    bool _findDate = false;
                                    if (_dates.contains(_date)) {
                                      _findDate = true;
                                    } else {
                                      _dates.add(_date);
                                    }

                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                            height: getProportionScreenHeight(
                                                20.0)),
                                        if (!_findDate)
                                          Text(
                                            _date,
                                          textAlign: TextAlign.center,
                                          ),
                                        SizedBox(
                                            height: getProportionScreenHeight(
                                                18.0)),
                                        OrderItemWidget(
                                          datas: _datas,
                                          total: snapshot.data['total'],
                                          process: snapshot.data['process'],
                                        ),
                                        Text(
                                          DateFormat('kk:mm a')
                                              .format(snapshot.data['date']
                                                  .toDate())
                                              .toString(),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    );
                                  }

                                  return Container();
                                },
                              );
                            },
                            childCount: _datas.length,
                          ),
                        ),
                      )
                    : SliverFillRemaining(
                        child: NoOrdersWidget(),
                      );
              }

              return SliverList(delegate: SliverChildListDelegate([]));
            },
          ),
        ],
      ),
    );
  }
}

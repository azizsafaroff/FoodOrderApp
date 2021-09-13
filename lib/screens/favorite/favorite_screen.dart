import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

import 'components/favorite_order_item.dart';
import 'components/no_favourites_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
                  title: "Favourites",
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
                final _datas = snapshot.data['favorite_items'];
                return _datas.length != 0
                    ? SliverPadding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionScreenWidth(40.0)),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return FavoriteOrderItem(
                                id: _datas[index],
                              );
                            },
                            childCount: _datas.length,
                          ),
                        ),
                      )
                    : SliverFillRemaining(
                        child: NoFavouritesWidget(),
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

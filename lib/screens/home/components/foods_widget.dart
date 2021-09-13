import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';

import 'collection_widget.dart';


class FoodsWidget extends StatelessWidget {
  const FoodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CollectionItemsWidget(),
          CollectionItemsWidget(),
          CollectionItemsWidget(),
          SizedBox(
            height: getProportionScreenHeight(140.0),
          ),
        ],
      ),
    );
  }
}
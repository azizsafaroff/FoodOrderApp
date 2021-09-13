import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/size_config.dart';

class NoFavouritesWidget extends StatelessWidget {
  const NoFavouritesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getProportionScreenWidth(180.0),
              height: getProportionScreenHeight(190.0),
              child: ImageIcon(
                AssetImage('assets/icons/favorite_icon.png'),
                color: Color(0xFFC7C7C7),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(28.0)),
            Text(
              "No favourites yet",
              style: TextStyle(
                fontSize: getProportionScreenWidth(28.0),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(28.0)),
            Text(
              "Hit the orange button down\nbelow to go to home",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionScreenWidth(20.0),
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: getProportionScreenHeight(40.0),
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
                Navigator.pop(context);
                },
              child: Text(
                "Go home",
                style: TextStyle(
                  fontSize: getProportionScreenWidth(17.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

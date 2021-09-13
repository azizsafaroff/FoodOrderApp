import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/screens/favorite/favorite_screen.dart';
import 'package:foods_order/screens/profile/profile_screen.dart';
import 'package:foods_order/screens/search/search_screen.dart';
import 'package:foods_order/size_config.dart';

class CustomBottomnNavigationbar extends StatelessWidget {
  const CustomBottomnNavigationbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionScreenHeight(100.0),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        children: [
          _button(index: 0, icon: 'assets/icons/home_icon.png'),
          _button(
              index: 1,
              icon: 'assets/icons/search_icon.png',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              }),
          _button(
              index: 2,
              icon: 'assets/icons/favorite_icon.png',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()));
              }),
          _button(
              index: 3,
              icon: 'assets/icons/person_icon.png',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              }),
        ],
      ),
    );
  }

  _button({index, icon, press}) {
    final iconColor;
    final size;

    if (index == 0) {
      iconColor = kPrimaryColor;
      size = 24.0;
    } else {
      iconColor = Color(0xFFADADAF);
      size = 24.0;
    }

    return Expanded(
      child: InkWell(
        onTap: press,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: getProportionScreenWidth(size),
                height: getProportionScreenWidth(size),
                child: ImageIcon(
                  AssetImage(icon),
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(8.0)),
          ],
        ),
      ),
    );
  }
}

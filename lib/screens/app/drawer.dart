import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/screens/auth/authentication.dart';
import 'package:foods_order/screens/order/orders_screen.dart';
import 'package:foods_order/screens/other/offer_promo_screen.dart';
import 'package:foods_order/screens/other/privacy_screen.dart';
import 'package:foods_order/screens/other/security_screen.dart';
import 'package:foods_order/screens/profile/profile_screen.dart';
import 'package:foods_order/size_config.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: getProportionScreenWidth(38.0)),
        child: Column(
          children: [
            SizedBox(height: getProportionScreenHeight(160.0)),
            _menuButton(
                index: 0,
                icon: 'profile_icon',
                text: 'Profile',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }),
            _menuButton(
                index: 1,
                icon: 'cart_icon',
                text: 'Orders',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersScreen()));
                }),
            _menuButton(
                index: 2,
                icon: 'promo_icon',
                text: 'Offer and promo',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OfferPromoScreen()));
                }),
            _menuButton(
                index: 3,
                icon: 'privacy_icon',
                text: 'Privacy policy',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyScreen()));
                }),
            _menuButton(
                index: 4,
                icon: 'security_icon',
                text: 'Security',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecurityScreen()));
                }),
            Spacer(),
            InkWell(
              onTap: () {
                Variables.authUser.signOut();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                    (route) => true);
              },
              child: Row(
                children: [
                  Text(
                    "Sign-out",
                    style: TextStyle(
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: getProportionScreenWidth(12.0)),
                  Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: getProportionScreenWidth(22.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionScreenHeight(87.0)),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({index, icon, text, press}) {
    final size;
    if (index == 0) {
      size = 22.0;
    } else if (index == 4) {
      size = 18.0;
    } else {
      size = 24.0;
    }
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          ImageIcon(
            AssetImage('assets/icons/$icon.png'),
            color: Colors.white,
            size: getProportionScreenWidth(size),
          ),
          SizedBox(width: getProportionScreenWidth(10.0)),
          Container(
            width: getProportionScreenWidth(132.0),
            padding: EdgeInsets.symmetric(
              vertical: getProportionScreenHeight(28.0),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: index != 4 ? Colors.white : Colors.transparent,
                  width: getProportionScreenWidth(0.5),
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: getProportionScreenWidth(17.0),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foods_order/constants.dart';
import 'package:foods_order/screens/auth/authentication.dart';
import 'package:foods_order/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionScreenHeight(56.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(50.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getProportionScreenWidth(73.0),
                  height: getProportionScreenWidth(73.0),
                  padding: EdgeInsets.all(getProportionScreenWidth(8.0)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: getProportionScreenHeight(35.0),
                ),
                Text(
                  "CALEB G Restaurant",
                  style: TextStyle(
                    fontSize: getProportionScreenWidth(65.0),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_image.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                width: getProportionScreenWidth(314.0),
                height: getProportionScreenHeight(70.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AuthScreen()));
                  },
                  child: Text(
                    "Get starteed",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

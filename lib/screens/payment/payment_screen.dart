import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

import 'components/custom_show_dialog.dart';

enum SingingCharacter { delivery, payment }

class PaymentScreen extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<PaymentScreen> {
  var selectedIndex = 1;
  var secondRadioIndex = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              // padding: EdgeInsets.only(
              //   bottom: 30,
              // ),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  CustomAppBar(
                    title: "Checkout",
                    action: false,
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(41),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionScreenWidth(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionScreenWidth(32),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(40.0),
                        ),
                        Text(
                          "Payment method",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(20),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: getProportionScreenWidth(16.0),
                            right: getProportionScreenWidth(65.0),
                            top: getProportionScreenHeight(20),
                            bottom: getProportionScreenHeight(20),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: selectedIndex,
                                      activeColor: Color(0xFFF47B0A),
                                      onChanged: (val) {
                                        setState(() {
                                          selectedIndex = val as int;
                                        });
                                      },
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      height: getProportionScreenWidth(40),
                                      width: getProportionScreenWidth(40),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/icons/card.png",
                                        ),
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF47B0A),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: getProportionScreenWidth(11),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              getProportionScreenHeight(25.0),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              width: getProportionScreenHeight(
                                                  0.5),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Card",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionScreenWidth(17)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: selectedIndex,
                                      activeColor: Color(0xFFEB4796),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedIndex = value as int;
                                        });
                                      },
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      height: getProportionScreenWidth(40),
                                      width: getProportionScreenWidth(40),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEB4796),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ImageIcon(
                                        AssetImage(
                                          "assets/icons/mobile.png",
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionScreenWidth(11),
                                    ),
                                    Text(
                                      "Mobile Money \n(MTN,VODA)",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionScreenWidth(17)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(76)),
                        Container(
                          width: SizeConfig.screenWidth! - 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery method.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionScreenWidth(15),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(20)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionScreenWidth(20),
                              vertical: getProportionScreenHeight(20)),
                          width: getProportionScreenWidth(315),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    secondRadioIndex = 0;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio<int>(
                                      value: 0,
                                      groupValue: secondRadioIndex,
                                      activeColor: Colors.black,
                                      onChanged: (int? a) {
                                        setState(() {
                                          secondRadioIndex = a!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                getProportionScreenHeight(25)),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    width: 1))),
                                        child: Text(
                                          "Door delivery",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionScreenWidth(17)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    secondRadioIndex = 1;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio<int>(
                                      value: 1,
                                      activeColor: Colors.black,
                                      groupValue: secondRadioIndex,
                                      onChanged: (int? a) {
                                        setState(() {
                                          secondRadioIndex = a!;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Pick up",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionScreenWidth(17)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(17.0),
                              ),
                            ),
                            Text(
                              Variables.total.toString(),
                              style: TextStyle(
                                fontSize: getProportionScreenWidth(22),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(150),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                height: getProportionScreenHeight(70.0),
                width: getProportionScreenWidth(315),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFA4A0C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogWidget();
                      },
                    );
                  },
                  child: Text(
                    "Process to payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionScreenWidth(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

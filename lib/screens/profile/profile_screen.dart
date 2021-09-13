import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/size_config.dart';
import 'package:foods_order/widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<ProfileScreen> {
  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height / 866;
    var w = size.width / 411;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomAppBar(
                  title: "My Profile",
                  action: false,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(Variables.authUser.currentUser!.uid).snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final _user = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(50.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: getProportionScreenHeight(55),
                            ),
                            Text(
                              "Information",
                              style: TextStyle(
                                  fontSize: getProportionScreenWidth(17),
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: getProportionScreenHeight(20),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16 * w, vertical: 16 * h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.03),
                                    offset: Offset(1, 1),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getProportionScreenWidth(60),
                                    height: getProportionScreenWidth(60),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/exopa.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionScreenWidth(15),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _user['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionScreenWidth(18)),
                                        ),
                                        SizedBox(
                                          height: getProportionScreenHeight(8),
                                        ),
                                        Text(
                                          _user['email'],
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize:
                                                  getProportionScreenWidth(13)),
                                        ),
                                        SizedBox(
                                            height:
                                                getProportionScreenHeight(9)),
                                        Text(
                                          "Trasaco hotel,behind navrongo campus",
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize:
                                                getProportionScreenWidth(13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionScreenHeight(48)),
                            Text(
                              "Payment method",
                              style: TextStyle(
                                  fontSize: getProportionScreenWidth(17),
                                  color: Colors.black),
                            ),
                            SizedBox(height: getProportionScreenHeight(21)),
                            Container(
                              padding: EdgeInsets.only(
                                left: getProportionScreenWidth(12.0),
                                right: getProportionScreenWidth(24.0),
                                top: getProportionScreenHeight(20),
                                bottom: getProportionScreenHeight(20),
                              ),
                              width: getProportionScreenWidth(315),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.03),
                                    offset: Offset(1, 1),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 0;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: selectedIndex,
                                          activeColor: Color(0xFFF47B0A),
                                          onChanged: (val) {
                                            setState(() {
                                              selectedIndex = val as int?;
                                            });
                                          },
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              getProportionScreenWidth(12.0)),
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
                                                    getProportionScreenHeight(
                                                        25)),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "Card",
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionScreenWidth(
                                                        17),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                          activeColor: Color(0xFFEB4796),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedIndex = value as int?;
                                            });
                                          },
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              getProportionScreenWidth(12.0)),
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
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    getProportionScreenHeight(
                                                        25)),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        width: 1))),
                                            child: Text(
                                              "Mobile Money (MTN,VODA)",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionScreenWidth(
                                                          17)),
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
                                          activeColor: Color(0xFF0038FF),
                                          onChanged: (val) {
                                            setState(() {
                                              selectedIndex = val as int?;
                                            });
                                          },
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              getProportionScreenWidth(12.0)),
                                          height: getProportionScreenWidth(40),
                                          width: getProportionScreenWidth(40),
                                          child: ImageIcon(
                                            AssetImage(
                                              "assets/icons/ppicon.png",
                                            ),
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF0038FF),
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
                                                    getProportionScreenHeight(
                                                        25)),
                                            child: Text(
                                              "Pay on delivery",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionScreenWidth(
                                                          17)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionScreenHeight(162),
                            ),
                          ],
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

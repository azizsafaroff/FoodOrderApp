import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/size_config.dart';

import 'login_screen.dart';
import 'sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, value) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: getProportionScreenHeight(280.0),
                        color: Colors.white,
                        child: Center(
                          child: Container(
                            height: getProportionScreenHeight(162.38),
                            width: getProportionScreenWidth(150.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 0.0,
                  elevation: 0.0,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  bottom: TabBar(
                    dragStartBehavior: DragStartBehavior.start,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: getProportionScreenWidth(50.0)),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Color.fromRGBO(250, 74, 12, 1),
                    indicatorWeight: 2.5,
                    tabs: [
                      Tab(text: 'Login'),
                      Tab(text: 'Sign Up'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                LoginWidget(),
                SignUpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

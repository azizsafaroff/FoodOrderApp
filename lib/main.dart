import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/screens/app/zoom.dart';

import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
          overline: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
          caption: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
          button: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Actor',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: FirebaseAuth.instance.currentUser != null ? Zooom() : Introduction(),
      // home: PaymentScreen(),
    );
  }
}

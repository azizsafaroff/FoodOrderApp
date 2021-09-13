import 'package:firebase_auth/firebase_auth.dart';

class Variables {
  static FirebaseAuth authUser = FirebaseAuth.instance;

  static List trashList = [];
  static List cartList = [];

  static int total = 0;
}

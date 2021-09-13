import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/screens/app/zoom.dart';
import 'package:foods_order/size_config.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpWidget> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _name = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(50.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionScreenHeight(80.0),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                    hintText: "Name",
                    labelText: "Name",
                  ),
                  controller: _name,
                  validator: (text) {
                    if (text!.length < 5) {
                      return "Kamida 3 ta belgi bolsin";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionScreenHeight(20.0),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                    hintText: "Email Address",
                    labelText: "Email Address",
                  ),
                  controller: _email,
                  validator: (text) {},
                ),
                SizedBox(
                  height: getProportionScreenHeight(20.0),
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(2.0, 7.0, 15.0, 10.0),
                    hintText: "Password",
                    labelText: "Password",
                  ),
                  controller: _password,
                  validator: (text) {
                    if (text!.length < 8) {
                      return "Kamida 4 ta belgi bolsin";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionScreenHeight(15.0),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot passcode?",
                      style: TextStyle(
                          color: Color.fromRGBO(250, 74, 12, 1),
                          fontSize: getProportionScreenHeight(17.0),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionScreenHeight(15.0),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: getProportionScreenHeight(40.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  getProportionScreenWidth(314.0),
                  getProportionScreenHeight(70.0),
                ),
                primary: Color.fromRGBO(250, 74, 12, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
            onPressed: _emailSignUp,
            child: Text(
              "Registor",
              style: TextStyle(
                fontSize: getProportionScreenHeight(17.0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _emailSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential _credential = await Variables.authUser
            .createUserWithEmailAndPassword(
                email: _email.text, password: _password.text);

        _credential.user!.updateDisplayName(_name.text);

        FirebaseFirestore.instance
            .collection('users')
            .doc(_credential.user!.uid)
            .set(
          {
            "email": _email.text,
            "name": _name.text,
            "password": _password.text,
            "cart_items": FieldValue.arrayUnion([]),
            "order_items": FieldValue.arrayUnion([]),
            "favorite_items": FieldValue.arrayUnion([]),
          },
        );

        if (Variables.authUser.currentUser != null) {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Zooom()));
        }
      } catch (e) {
        print("XATO: " + e.toString());
      }
    }
  }
}

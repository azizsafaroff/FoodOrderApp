import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_order/schema/variables.dart';
import 'package:foods_order/screens/app/zoom.dart';
import 'package:foods_order/size_config.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email address",
                    labelText: "Email address",
                  ),
                  controller: _email,
                  validator: (text) {
                    if (text!.length < 5) {
                      return "Kamida 5 ta belgi bolsin";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionScreenHeight(36.0),
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                  controller: _password,
                  validator: (text) {
                    if (text!.length < 4) {
                      return "Kamida 4 ta belgi bolsin";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionScreenHeight(20.0),
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
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: getProportionScreenHeight(40.0),
          child: Container(
            width: getProportionScreenWidth(314.0),
            height: getProportionScreenHeight(70.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(250, 74, 12, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                signIn(context);
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: getProportionScreenHeight(17.0),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  signIn(context) async {
    try {
      if (_formKey.currentState!.validate()) {
        // FocusScope.of(context).unfocus();
        Variables.authUser
            .signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        )
            .then((value) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Zooom()));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Email yoki Password Xato"),
        ),
      );
    }
  }
}

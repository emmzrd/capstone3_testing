import 'package:capstone3_testing/components/rounded_button.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:capstone3_testing/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorWhite,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
          color: kColorBlack, icon: Icon(Icons.arrow_back_ios,),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(

          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/fieldpass_logo.png',
                  width: 45,
                  height: 75,
                ),
                Spacer(),
                Container(
                  width: 302, height: 57,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(width: 302, height: 57,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                    obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    child: Text('Log in',style: k50014RobotoBlackTextStyle,),
                    style: ElevatedButton.styleFrom(
                    elevation: 1,
                    primary: kColorWhite,
                    fixedSize: Size(302, 57)),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                 ),
                Spacer(flex: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


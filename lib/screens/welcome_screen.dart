import 'package:capstone3_testing/others/home_screen_other.dart';
import 'package:capstone3_testing/screens/login_screen.dart';
import 'package:capstone3_testing/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/components/rounded_button.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import '../utilities/constants.dart';
import 'package:capstone3_testing/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorWhite,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 36.0,
              right: 36,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    'assets/fieldpass_logo.png',
                    width: 45,
                    height: 75,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text('Flutter FieldPass', style: k50014RobotoBlackTextStyle),
                  SizedBox(
                    height: 76.0,
                  ),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/microsoft.png',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Sign in with Microsoft',
                          style: k40014RobotoBlackTextStyle,
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/double_arrow_icon.png',
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: kColorWhite,
                        fixedSize: Size(302, 57)),
                    onPressed: () {
                      // Navigator.pushNamed(context, LoginScreen.id);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreenOther()));
                    },
                  ),
                  const Spacer(flex: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Impressum',
                          style: k60014MulishBlackTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Datenschutz',
                          style: k60014MulishBlackTextStyle,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}

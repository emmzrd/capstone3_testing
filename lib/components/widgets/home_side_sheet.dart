import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone3_testing/components/widgets/home_side_bar_button.dart';
import 'package:capstone3_testing/screens/business_card_screen.dart';
import 'package:capstone3_testing/screens/home_screen.dart';

import 'package:capstone3_testing/models/post.dart';
class HomeSideSheet extends StatelessWidget {
  const HomeSideSheet({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () {
        SideSheet.left(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/close.svg',
                        ),
                        onPressed: () {
                          // Navigator.pop(context);
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        },
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/logo/logo.svg',
                        height: 31,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HomeSideBarButton(
                    svgIcon: 'assets/icons/user_grey.svg',
                    text: 'Mein Konto',
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                  ),
                  HomeSideBarButton(
                    svgIcon: 'assets/icons/business_card.svg',
                    text: 'Visitenkarte',
                    onpressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BusinessCardScreen()));
                    },
                  ),
                  HomeSideBarButton(
                    svgIcon: 'assets/icons/time.svg',
                    text: 'Zeiterfassung',
                    onpressed: () {},
                  ),
                  HomeSideBarButton(
                    svgIcon: 'assets/icons/bet.svg',
                    text: 'Meine Einsätze',
                    onpressed: () {},
                  ),
                ],
              ),
            ),
          ),
          context: context,
        );
      },
      icon: Icon(Icons.menu),
    );
  }
}


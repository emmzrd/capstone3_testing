
import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone3_testing/components/widgets/home_side_bar_button.dart';
import 'package:capstone3_testing/screens/home_screen.dart';
import 'package:capstone3_testing/screens/business_card_screen.dart';
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kColorWhite,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
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
                    SvgPicture.asset('assets/logo/logo.svg',height: 31,),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                HomeSideBarButton(
                  svgIcon: 'assets/icons/user_grey.svg',
                  text: 'Mein Konto',
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                ),

                HomeSideBarButton(
                  svgIcon: 'assets/icons/business_card.svg',
                  text: 'Visitenkarte',
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
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
                  onpressed: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

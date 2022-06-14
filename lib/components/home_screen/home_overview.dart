import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone3_testing/components/widgets/home_overview_button.dart';
import 'package:capstone3_testing/screens/apply_leave_screen.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({Key? key, required this.friendPosts}) : super(key: key);
  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: double.infinity,
      color: kColorWhite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Übersicht 2021 ',
                      style: kBold22RobotoBlackTextStyle,
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/tree.svg')
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Overview(
                  text1: 'Jahresurlaub',
                  text2: '25',
                ),
                SizedBox(
                  height: 16,
                ),
                Overview(text1: 'Resturlaub EPOS', text2: '10'),
                SizedBox(
                  height: 16,
                ),
                Overview(text1: 'Beantragt', text2: '08'),
                SizedBox(
                  height: 16,
                ),
                Overview(text1: 'Übertrag Vorjahr', text2: '01'),
                Text(
                  'gültig bis 31.03.2021',
                  style: k40012RobotoGreyTextStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                HomeOverviewButton(
                  textButton: 'Urlaub beantragen',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplyLeaveScreen(friendPosts: friendPosts)));
                  },
                ),
                SizedBox(
                  height: 16,
                ),

              ],
            ),
          ),
          Container(color: kColorE0E0E0Grey,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Aktuelles Budget',
                    style: k40014RobotoBlackTextStyle,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: kColorFFB72BYellowOrange,
                    child: Center(
                      child: Text(
                        '7',
                        style: k50016RobotoWhiteTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}



class Overview extends StatelessWidget {
  Overview({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: k40014RobotoBlackTextStyle,
        ),
        Spacer(),
        Text(text2),
      ],
    );
  }
}

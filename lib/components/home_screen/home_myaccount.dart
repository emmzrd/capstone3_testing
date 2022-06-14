import 'package:capstone3_testing/screens/business_card_screen.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone3_testing/components/widgets/user_info_circle_avatar.dart';
class HomeMyAccount extends StatelessWidget {
  HomeMyAccount({Key? key, required this.friendPosts}) : super(key: key);
  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    final Post post0 = friendPosts[0];
    final Post post1 = friendPosts[1];
    return Container(
      height: 625,
      width: double.infinity,
      color: kColorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 27, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BusinessCardScreen(friendPosts: friendPosts,)));
              },
              child: Text(
                'Mein Konto',
                style: kBold22RobotoBlackTextStyle,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            UserInfoCircleAvatar(profileImageUrl: post0.profileImageUrl,name: post0.name,position: post0.position,email: post0.email,),
            SizedBox(height: 41),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessCardScreen(friendPosts: friendPosts)));
              },
              child: Text(
                'Vorgesetzte(r)',
                style: kBold22RobotoBlackTextStyle,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            UserInfoCircleAvatar(profileImageUrl: post1.profileImageUrl, name: post1.name, email: post1.email, position: post1.position),
            SizedBox(height: 27),
            Text('Wochenbericht', style: kBold22RobotoBlackTextStyle),
            SizedBox(height: 22),
            HomeReport(
              onPressed: (){},
              date: '12.03-19.03.2021',
              textButton: 'Wochenbericht zuschicken',
            ),
            SizedBox(
              height: 27,
            ),
            Text('Monatsbericht', style: kBold22RobotoBlackTextStyle),
            SizedBox(height: 23,),
            HomeReport(
              onPressed: (){},
              date: 'April 2020',
              textButton: 'Monatsbericht erstellen',
            ),
          ],
        ),
      ),
    );
  }
}



class HomeReport extends StatelessWidget {
  HomeReport({Key? key, required this.date, required this.textButton, required this.onPressed})
      : super(
          key: key,
        );
  String date;
  String textButton;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/calendar.svg'),
        SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: k50016RobotoBlackTextStyle,
            ),
            SizedBox(
              height: 13,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  primary: kColorBlack,
                ),
                onPressed: onPressed,
                child: Row(
                  children: [
                    Text(
                      textButton,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    SvgPicture.asset(
                      'assets/icons/paper_plane_white.svg',
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}

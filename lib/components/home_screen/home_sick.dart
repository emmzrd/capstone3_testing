import 'package:capstone3_testing/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/components/widgets/home_overview_button.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/screens/apply_leave_screen.dart';
class HomeSick extends StatelessWidget {
  const HomeSick({Key? key, required this.friendPosts}) : super(key: key);

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      color: kColorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Krankheitstage',
              style: kBold22RobotoBlackTextStyle,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Insgesamt',
                  style: k40014MulishBlackTextStyle,
                ),
                Spacer(),
                Text(
                  '03',
                  style: k50016RobotoBlackTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            HomeOverviewButton(
              textButton: 'Krankheit eirreichen',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyLeaveScreen(friendPosts: friendPosts)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

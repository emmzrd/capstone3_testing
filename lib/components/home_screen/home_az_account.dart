import 'package:capstone3_testing/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/components/widgets/home_overview_button.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/models/post.dart';

class HomeAzAccount extends StatelessWidget {
  const HomeAzAccount({Key? key,required this.friendPosts}) : super(key: key);
  final List<Post> friendPosts;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: double.infinity,
      color: kColorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(crossAxisAlignment:CrossAxisAlignment.start,
          children: [
          Text('AZ Konto',style: kBold22RobotoBlackTextStyle,),
          SizedBox(height: 27,),
          Row(children: [
            Text('Stunden',style: k40014MulishBlackTextStyle,),
            Spacer(),
            Text('100/250',style: k50016RobotoBlackTextStyle,),
          ],),
        ],),
      ),
    );
  }
}

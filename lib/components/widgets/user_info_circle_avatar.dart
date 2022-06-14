import 'package:flutter/material.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/utilities/constants.dart';

class UserInfoCircleAvatar extends StatelessWidget {
  const UserInfoCircleAvatar({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.email,
    required this.position,
  }) : super(key: key);

  final profileImageUrl;
  final name;
  final email;
  final position;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profileImageUrl),
          radius: 30,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: k50016RobotoBlackTextStyle,
            ),
            Text(
              email,
              style: k40012RobotoGreyTextStyle,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              position,
              style: k40012RobotoGreyTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

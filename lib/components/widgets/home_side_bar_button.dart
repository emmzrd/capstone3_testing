import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
class HomeSideBarButton extends StatelessWidget {
  String svgIcon;
  String text;

  HomeSideBarButton(
      {required this.svgIcon, required this.text, required this.onpressed});

  var onpressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 100,
      icon: Column(
        children: [
          SvgPicture.asset(
            svgIcon,
            color: kColorGrey,
          ),
          SizedBox(
            height: 15,
          ),
          Text(text, style: k50014RobotoMirageBlackTextStyle),
        ],
      ),
      onPressed: onpressed,
    );
  }
}

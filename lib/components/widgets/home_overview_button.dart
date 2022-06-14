import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeOverviewButton extends StatelessWidget {
  HomeOverviewButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);
  String textButton;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              // fixedSize: Size(179, 42),
              primary: kColorBlack,
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  textButton,
                  style: k50014RobotoWhiteTextStyle,
                ),
                SizedBox(
                  width: 13,
                ),
                SvgPicture.asset(
                  'assets/icons/add_white.svg',
                ),
              ],
            )),
      ],
    );
  }
}
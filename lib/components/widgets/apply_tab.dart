import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/constants.dart';
class ApplyTab extends StatelessWidget {
  ApplyTab({Key? key, required this.applyText}) : super(key: key);
  String applyText;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 50,
        width: 123,
        child: Center(
          child: Text(
            applyText,
            style: k40017RobotoTextStyle,
          ),
        ),
      ),
    );
  }
}
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorGrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorGrey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const k40014RobotoBlackTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: kColorBlack);

const k50014RobotoBlackTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: kColorBlack,
  fontFamily: 'Roboto',
);

const k60014MulishBlackTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
  color: kColorMirageBlack,
  fontFamily: 'Mulish',
);

const k50014RobotoMirageBlackTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  color: kColorMirageBlack,
  fontFamily: 'Roboto',
);

const kBold22RobotoBlackTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kColorBlack,
  fontFamily: 'Roboto',
);

const k50016RobotoBlackTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
  fontFamily: 'Roboto',
);

const k40012RobotoMirageBlackTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: kColorMirageBlack,
  fontFamily: 'Roboto',
);

const k40012RobotoWhiteTextStyle = TextStyle(
  backgroundColor: kColorBlack,
  color: kColorWhite,
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Roboto',
);

const k40012RobotoGreyTextStyle = TextStyle(
  color: kColorGrey,
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Roboto',
);

const k50014RobotoWhiteTextStyle = TextStyle(
  color: kColorWhite,
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Roboto',
);
const k50016RobotoWhiteTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: kColorWhite,
  fontFamily: 'Roboto',
);
const k40014MulishBlackTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
  fontFamily: 'Mulish',
);

const k40017RobotoTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w400,
);

const k40012RobotoBlueTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: kColor00A4EABlue,
  fontFamily: 'Mulish',
);

const k40022AllertaBlackTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  color: kColorBlack,
  fontFamily: 'Allerta',
);

const k40014AllertaMirageBlackTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: kColorMirageBlack,
  fontFamily: 'Allerta',
);

const k40016AllertaBlackTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  color: kColorBlack,
  fontFamily: 'Allerta',
);

const k60010MulishMirageBlackTextStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.w600,
  color: kColorMirageBlack,
  fontFamily: 'Mulish',
);

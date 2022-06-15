import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/components/widgets/home_side_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/screens/calendar_screen.dart';
class TimeTrackingScreen extends StatefulWidget {
  TimeTrackingScreen({Key? key, required this.friendPosts}) : super(key: key);
  int mondayEdit = 4;
  int tuesdayEdit = 4;
  int wednesdayEdit = 4;
  int thursdayEdit = 4;
  int fridayEdit = 4;
  int saturdayEdit = 4;
  int sundayEdit = 4;
  List<Post> friendPosts;
  var date = DateTime.now();

  @override
  State<TimeTrackingScreen> createState() => _TimeTrackingScreenState();
}

class _TimeTrackingScreenState extends State<TimeTrackingScreen> {
  String getTodaysDay(date) {
    String todaysDay = DateFormat('EEEE').format(date);
    return todaysDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTodaysDay(widget.date),
                    style: kBold22RobotoBlackTextStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        'Offen',
                        style: k40012RobotoWhiteTextStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${DateTime.now().month}.${DateTime.now().day}.${DateTime.now().year}',
                        style: k40014RobotoGreyTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 50),
                  shape: CircleBorder(),
                  side: BorderSide(color: kColorBlack),
                  primary: kColorWhite,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarScreen()));
                },
                child: SvgPicture.asset(
                  'assets/icons/calendar_dotted.svg',
                  height: 22,
                  width: 22,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 50),
                  shape: CircleBorder(),
                  primary: kColorE0E0E0Grey,
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/icons/add_black.svg',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
          leading: HomeSideSheet(friendPosts: widget.friendPosts),
          backgroundColor: kColorWhite,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kColorBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kColorF5F5F5LightGrey,
          child: Column(
            children: [
              Container(
                color: kColorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DayTimetableButton(
                        text: 'Mi',
                        backgroundColor: kColorE14141Red,
                        day: widget.mondayEdit),
                    DayTimetableButton(
                        text: 'Di',
                        backgroundColor: kColorFFB72BYellowOrange,
                        day: widget.tuesdayEdit),
                    DayTimetableButton(
                        text: 'Mi',
                        backgroundColor: kColor6788ffBlue,
                        day: widget.wednesdayEdit),
                    DayTimetableButton(
                        text: 'Do',
                        backgroundColor: kColor8465FFBlueViolet,
                        day: widget.thursdayEdit),
                    DayTimetableButton(
                        text: 'Fr',
                        backgroundColor: kColorYellow,
                        day: widget.fridayEdit),
                    DayTimetableButton(
                        text: 'Sa',
                        backgroundColor: kColorGreenAccent,
                        day: widget.saturdayEdit),
                    DayTimetableButton(
                        text: 'So',
                        backgroundColor: kColorPinkAccent,
                        day: widget.sundayEdit),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 440,
                color: kColorF5F5F5LightGrey,
                child: SfCalendar(
                  allowViewNavigation: true,
                  selectionDecoration: BoxDecoration(
                    color: kColord7ebf3LightBlue,
                    border: Border.all(color: kColord7ebf3LightBlue, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                  showNavigationArrow: true,
                  timeSlotViewSettings: TimeSlotViewSettings(
                      // timeIntervalHeight: -1,
                      ),
                  view: CalendarView.day,
                  allowedViews: [
                    CalendarView.day,
                    CalendarView.week,
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(343, 80), primary: kColorWhite,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(59) )),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '08:00 Std',
                                  style: kBold22RobotoBlackTextStyle,
                                ),
                                Text(
                                  'Arbeitszeiten Insgesamt für heute',
                                  style: k40012RobotoGreyTextStyle,
                                )
                              ]),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: kColorBlack,
                            child: SvgPicture.asset(
                              'assets/icons/paper_plane_white.svg',
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayTimetableButton extends StatelessWidget {
  DayTimetableButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.day})
      : super(key: key);

  late int day;
  final text;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                primary: kColorWhite,
                elevation: 0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: backgroundColor,
                  child: SvgPicture.asset(
                    day == 4
                        ? 'assets/icons/check_black.svg'
                        : day == 3
                            ? 'assets/icons/paper_plane_white.svg'
                            : day == 2
                                ? 'assets/icons/edit_white.svg'
                                : '${day = 5}',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(text, style: k40012RobotoBlackTextStyle),
              ],
            ),
            onPressed: () {
              setState(() {
                day -= 1;
              });
            });
      },
    );
  }
}

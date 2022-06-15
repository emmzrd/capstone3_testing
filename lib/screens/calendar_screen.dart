import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrolling_years_calendar/scrolling_years_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,leading: IconButton(icon: SvgPicture.asset('assets/icons/close.svg'),onPressed: (){
        Navigator.pop(context);
      },),backgroundColor: kColorWhite,),
      backgroundColor: kColorF5F5F5LightGrey,
      body: ScrollingYearsCalendar(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
        lastDate: DateTime.now().add(Duration(days:5*365)),
        currentDateColor: Colors.blue,
        highlightedDateColor: Colors.deepOrange,
        monthTitleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: kColorBlack,
        ),
        monthNames: const <String>[
          'January',
          'February',
          'March',
          'April',
          'May',
          'June',
          'July',
          'August',
          'September',
          'October',
          'November',
          'December',
        ],
      ),
    );
  }
}

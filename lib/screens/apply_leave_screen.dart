import 'package:flutter/material.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/components/widgets/apply_tab.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyLeaveScreen extends StatefulWidget {
  ApplyLeaveScreen({Key? key, required this.friendPosts}) : super(key: key);
  List<Post> friendPosts;

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final DateRangePickerController _controller = DateRangePickerController();
  // String _startDate = '';
  // String _endDate = '';
  String typeOfLeave = 'Firmenurlaub';
  String timeOfLeave = 'Ganzer Tag';
  String substituteUser = 'Tony Stark';
  late String _startDate, _endDate;
  // void viewChanged(DateRangePickerViewChangedArgs args) {
  //   SchedulerBinding.instance.addPostFrameCallback((duration) {
  //     setState(() {
  //       _startDate = DateFormat('MMMM dd, yyyy')
  //           .format(args.visibleDateRange.startDate!)
  //           .toString();
  //       _endDate = DateFormat('MMMM dd, yyyy')
  //           .format(args.visibleDateRange.endDate!)
  //           .toString();
  //     });
  //   });
  //   //   });
  //   // SchedulerBinding.instance!.addPostFrameCallback((duration) {
  //   //   setState(() {});
  //   // });
  // }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('MMMM dd, yyyy').format(args.value.startDate).toString();
      _endDate =
          DateFormat('MMMM dd, yyyy').format(args.value.endDate ?? args.value.startDate).toString();
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    final DateTime today = DateTime.now();
    _startDate = DateFormat('MMMM dd, yyyy').format(today).toString();
    _endDate = DateFormat('MMMM dd, yyyy').format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange = PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Post post0 = widget.friendPosts[0];
    final Post post1 = widget.friendPosts[1];
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData(color: kColorBlack),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                color: kColorE0E0E0Grey,
                child: TabBar(
                  indicatorColor: kColor8465FFBlueViolet,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: kColorGrey,
                  labelColor: kColorBlack,
                  tabs: [
                    ApplyTab(
                      applyText: 'Monat',
                    ),
                    ApplyTab(
                      applyText: 'Jahr',
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: kColorE0E0E0Grey,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        SfDateRangePicker(
                          showNavigationArrow: true,
                          showActionButtons: true,
                          view: DateRangePickerView.month,
                          controller: _controller,
                          selectionMode: DateRangePickerSelectionMode.range,
                          toggleDaySelection: true,
                          onSelectionChanged: selectionChanged,
                          // onViewChanged: viewChanged,
                          onSubmit: (value) {
                            LeaveCalendarShowModalBottomSheet(context, post0);
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SfDateRangePicker(
                          showNavigationArrow: true,
                          showActionButtons: true,
                          view: DateRangePickerView.year,
                          controller: _controller,
                          selectionMode: DateRangePickerSelectionMode.range,
                          toggleDaySelection: true,
                          onSelectionChanged: selectionChanged,
                          // onViewChanged: viewChanged,
                          onSubmit: (value) {
                            LeaveCalendarShowModalBottomSheet(context, post0);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> LeaveCalendarShowModalBottomSheet(
      BuildContext context, Post post0) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              height: 640,
              color: kColorWhite,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  left: 20,
                  right: 20,
                ),
                // bottom: MediaQuery
                //     .of(context)
                //     .viewInsets
                //     .bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          'Zeitraum',
                          style: k40022AllertaBlackTextStyle,
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/icons/close.svg',
                          height: 20,
                        ),
                      ],
                    ),
                    Text('$_startDate - $_endDate',
                        style: k40014AllertaMirageBlackTextStyle),
                    SizedBox(height: 16),
                    TotalDaysText(
                      text1: 'Tage insgesamt',
                      text2: '7',
                    ),
                    SizedBox(height: 16),
                    TotalDaysText(
                        text1: 'Aktuelles Urlaubsbudget', text2: '30'),
                    SizedBox(height: 16),
                    TotalDaysText(text1: 'Beantragte Urlaubstage', text2: '8'),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(post0.profileImageUrl),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: TextField(
                            // autofocus: true,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'bemerkung hinzufügen',
                              hintStyle: k40012RobotoGreyTextStyle,
                              filled: true,
                              fillColor: kColorF5F5F5LightGrey,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kColorF5F5F5LightGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kColorF5F5F5LightGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    DropdownButton<String>(
                      icon: SvgPicture.asset(
                          'assets/icons/double_down_arrow.svg'),
                      isExpanded: true,
                      value: typeOfLeave,
                      elevation: 16,
                      style: k40014RobotoBlackTextStyle,
                      underline: Container(
                        color: kColorE0E0E0Grey,
                        height: 3,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          typeOfLeave = newValue!;
                        });
                      },
                      items: <String>[
                        'Firmenurlaub',
                        'Urlaub',
                        'Krankenstand',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: k40014RobotoBlackTextStyle),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    DropdownButton<String>(
                      icon: SvgPicture.asset(
                          'assets/icons/double_down_arrow.svg'),
                      isExpanded: true,
                      value: timeOfLeave,
                      elevation: 16,
                      style: k40014RobotoBlackTextStyle,
                      underline: Container(
                        color: kColorE0E0E0Grey,
                        height: 3,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          timeOfLeave = newValue!;
                        });
                      },
                      items: <String>[
                        'Ganzer Tag',
                        'Ersten Halben Tag',
                        'Zweiten Halbtag'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: k40014RobotoBlackTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 28),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: kColorE0E0E0Grey, width: 4))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/users/$substituteUser.png'),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              icon: SvgPicture.asset('assets/icons/close.svg'),
                              isExpanded: true,
                              value: substituteUser,
                              elevation: 16,
                              style: k40014RobotoBlackTextStyle,
                              underline: Container(
                                color: kColorWhite,
                                height: 3,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  substituteUser = newValue!;
                                });
                              },
                              items: <String>[
                                'Tony Stark',
                                'Stephen Strange',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: ListTile(
                                    title: Text(
                                      value,
                                      style: k40014RobotoBlackTextStyle,
                                    ),
                                    subtitle: Text(
                                      'Vertretung durch',
                                      style: k60010MulishMirageBlackTextStyle,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: Row(
                            children: [
                              const Text(
                                'Abschicken',
                                style: k50014RobotoWhiteTextStyle,
                              ),
                              SizedBox(width: 13),
                              SvgPicture.asset(
                                  'assets/icons/paper_plane_white.svg'),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 350,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 32,
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: SvgPicture.asset(
                                                      'assets/icons/close.svg'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            SvgPicture.asset(
                                              'assets/icons/time.svg',
                                              height: 42,
                                            ),
                                            SizedBox(height: 32),
                                            Text('Vielen Dank.',
                                                style:
                                                    k40022AllertaBlackTextStyle),
                                            SizedBox(height: 16),
                                            Text(
                                                'Wir haben Ihren Antrag erfasst.',
                                                style:
                                                    k60014MulishBlackTextStyle),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kColorFFB72BYellowOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

class TotalDaysText extends StatelessWidget {
  const TotalDaysText({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1, style: k60014MulishBlackTextStyle),
        Spacer(),
        Text(text2, style: k40016AllertaBlackTextStyle),
      ],
    );
  }
}

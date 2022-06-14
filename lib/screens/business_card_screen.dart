import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/others/home_drawer_other.dart';
import 'package:capstone3_testing/components/widgets/home_side_sheet.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:capstone3_testing/models/post.dart';
import 'package:capstone3_testing/utilities/constants.dart';
import 'package:capstone3_testing/components/widgets/user_info_circle_avatar.dart';
import 'package:capstone3_testing/components/widgets/apply_tab.dart';
class BusinessCardScreen extends StatefulWidget {
  BusinessCardScreen({Key? key, required this.friendPosts}) : super(key: key);

  List<Post> friendPosts;

  @override
  State<BusinessCardScreen> createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Post post0 = widget.friendPosts[0];
    final Post post1 = widget.friendPosts[1];
    return Scaffold(
      backgroundColor: kColorF4F4F4Grey,
      // drawer: HomeDrawer(),
      appBar: AppBar(
        leading: HomeSideSheet(),
        backgroundColor: kColorWhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kColorBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TabBar(
                indicatorColor: kColor8465FFBlueViolet,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                unselectedLabelColor: kColorGrey,
                labelColor: kColorBlack,
                tabs: [
                  ApplyTab(
                    applyText: 'Meine Visitenkarte',
                  ),
                  ApplyTab(
                    applyText: 'Vorgesetzte',
                  ),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 780,
                width: double.infinity,
                color: kColorWhite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BCAddress(post0: post0, text: 'Visitenkarte',),
                    BCAddress(post0: post1, text: 'Vorgesetzte',),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BCAddress extends StatelessWidget {
  const BCAddress({
    Key? key,
    required this.post0, required this.text
  }) : super(key: key);

  final Post post0;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 27, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: kBold22RobotoBlackTextStyle,
          ),
          SizedBox(
            height: 9),
          UserInfoCircleAvatar(
            profileImageUrl: post0.profileImageUrl,
            name: post0.name,
            email: post0.email,
            position: post0.position,
          ),
          SizedBox(height: 36,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('assets/qr_code.png',height: 244,width: 244,),
          ],),
          SizedBox(height: 27,),
          Text('Adresse',style: kBold22RobotoBlackTextStyle,),
          SizedBox(height: 17,),
          Row(children: [
            Icon(Icons.location_on_outlined,size: 50,),
            SizedBox(width: 30 ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Flutter Bootcamp',style: k50016RobotoBlackTextStyle,),
              Text('6783 Ayala Ave\n1200 Metro Kanila',style: k40012RobotoGreyTextStyle,)
            ],),
          ],),
          SizedBox(height: 45,),
          Text('Kontakt',style: kBold22RobotoBlackTextStyle,),

          SizedBox(height: 18,),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.person_outlined,size: 50,),
            SizedBox(width: 30 ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('T: ${post0.telephone}',style: k50016RobotoBlackTextStyle ,),
                Text('F: ${post0.fax}',style: k50016RobotoBlackTextStyle ,),
                Text('M: ${post0.mobile}',style: k50016RobotoBlackTextStyle ,),
                Text('E: ${post0.email}',style: k50016RobotoBlackTextStyle ,),

              ],),
          ],),
          SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('www.flutter-bootcamp.com',style: k40012RobotoBlueTextStyle,)],),
        ],
      ),
    );
  }
}


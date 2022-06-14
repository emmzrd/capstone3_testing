import 'package:capstone3_testing/components/home_screen/home_overview.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/utilities/color_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capstone3_testing/models/user.dart';
import 'package:capstone3_testing/models/explore_data.dart';
import 'package:capstone3_testing/api/mock_app_service.dart';
import 'package:capstone3_testing/components/home_screen/home_myaccount.dart';
import 'package:capstone3_testing/components/home_screen/home_sick.dart';
import 'package:capstone3_testing/components/home_screen/home_az_account.dart';
import '../components/home_screen/home_myaccount.dart';
import 'package:capstone3_testing/components/widgets/home_side_sheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final mockService = MockAppService();


  Stream<List<User>> readUsers() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => User.fromJson(doc.data()),
                )
                .toList(),
          );

  @override
  Widget build(BuildContext context) {
    var friendPosts2;

    return MaterialApp(
      home: Scaffold(
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
        body: FutureBuilder(
          future: mockService.getExploreData(),
          builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final friendPosts = snapshot.data?.friendPosts ?? [];


              return Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    HomeMyAccount(friendPosts: friendPosts),
                    SizedBox(height: 11),
                    HomeOverview(friendPosts: friendPosts),
                    SizedBox(height: 11),
                    HomeSick(friendPosts: friendPosts),
                    SizedBox(height: 11),
                    HomeAzAccount(friendPosts: friendPosts),

                    // FriendPostListViewHorizontal(friendPosts: friendPosts),
                    // FriendPostListView(friendPosts: friendPosts),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}


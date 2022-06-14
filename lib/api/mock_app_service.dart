import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:capstone3_testing/models/explore_data.dart';
import 'package:capstone3_testing/models/post.dart';
class MockAppService {
  Future<ExploreData> getExploreData() async {
    final friendPosts = await _getFriendFeed();

    return ExploreData(friendPosts);
  }


  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_company_feed.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return List.empty(growable: true);
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

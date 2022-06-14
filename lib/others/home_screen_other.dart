import 'package:flutter/material.dart';
import 'package:capstone3_testing/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//bac up file for others
class HomeScreenOther extends StatelessWidget {
  const HomeScreenOther({Key? key}) : super(key: key);

  Stream<List<User>> readUsers() =>
      FirebaseFirestore.instance
          .collection('users').snapshots()
          .map((snapshot) =>
          snapshot.docs
              .map((doc) => User.fromJson(doc.data()),).toList(),);


  Future<List<User>> fetchUsers() async {
    Future<List<User>> users = FirebaseFirestore.instance.collection('users').get().then((value) => value.docs.map((e)=> User.fromJson(e.data())).toList(),); return users;
  }

  @override
  Widget build(BuildContext context) {
    print(fetchUsers());
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          title: Text(
            fetchUsers().toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data;
              print(users);

              return ListView(
                children: users!
                    .map((u) =>
                    Text(
                      u.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

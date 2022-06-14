import 'package:capstone3_testing/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserServices {
  List<User> _users =  List<User>.empty(growable: true);

  List <User> get users => _users;

  Future<void> fetchUsers()async{
    Stream<List<User>> userStream=
        FirebaseFirestore.instance
            .collection('users').snapshots()
            .map((snapshot) =>
            snapshot.docs
                .map((doc) => User.fromJson(doc.data()),).toList(),);
    _users = await userStream.first;
  }

}
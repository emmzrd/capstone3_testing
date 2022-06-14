import 'package:capstone3_testing/models/user.dart';
import 'package:async_redux/async_redux.dart';

class AccountViewModel extends Vm{
  final List<User> users;
  AccountViewModel({required this.users}): super(equals: [users]);



}
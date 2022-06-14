import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:capstone3_testing/services/user_services.dart';
import 'package:capstone3_testing/states/app_state.dart';
class FetchUsers extends ReduxAction<AppState>{
  @override
  Future<AppState> reduce() async {
    try{
      final userService = UserServices();
      await userService.fetchUsers();

      final users = userService.users;
      return state.copyWith(users: users);
    }on Exception catch(e){
      print(e);
    }
    return state;
  }


}
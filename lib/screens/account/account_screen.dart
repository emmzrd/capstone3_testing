import 'package:async_redux/async_redux.dart';
import 'package:capstone3_testing/actions/user/fetch_user.dart';
import 'package:capstone3_testing/screens/account/account_view_model.dart';
import 'package:flutter/material.dart';

import '../../states/app_state.dart';
import 'account_factory.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountViewModel>(
      vm: () => AccountFactory(this),
      onInit: (store) async => await store.dispatch(FetchUsers()),
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: ListView.builder(
            itemCount: vm.users.length,
            itemBuilder: (context, index) => Text(vm.users[index].name)),
      ),
    );
  }
}

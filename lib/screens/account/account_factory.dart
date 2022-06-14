import 'package:async_redux/async_redux.dart';
import 'package:capstone3_testing/screens/account/account_view_model.dart';
import 'package:capstone3_testing/states/app_state.dart';
import 'account_screen.dart';

class AccountFactory extends VmFactory<AppState, AccountScreen> {
  AccountFactory(super.widget);

  @override
  Vm? fromStore(){
    return AccountViewModel(users:state.users);
  }

}
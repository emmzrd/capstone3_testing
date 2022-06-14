// @dart=2.9
import 'package:async_redux/async_redux.dart';
import 'package:capstone3_testing/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:capstone3_testing/screens/welcome_screen.dart';
import 'package:capstone3_testing/screens/login_screen.dart';
import 'package:capstone3_testing/screens/registration_screen.dart';
import 'package:capstone3_testing/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Platform  Firebase App Id
// android   1:951198207711:android:a25a07fa4a627d93aca36a
// void main() =>  runApp(FlashChat());
void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final store = Store<AppState>(initialState: AppState.initialState());
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}




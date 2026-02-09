import 'package:chat_app/helper/helper.dart';
import 'package:chat_app/pages/auth/home_page.dart';
import 'package:chat_app/pages/auth/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'shared/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Protect against UnsupportedError on platforms not configured in
  // `firebase_options.dart` (e.g. Windows) so the app can still start.
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on UnsupportedError {
    // Fallback: initialize without explicit options. Configure windows
    // options via `flutterfire configure` for full Firebase support.
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserLoggedInStatus();
  // }

  // getUserLoggedInStatus() async {
  //   await HelperFunctions.getUserLoggedInStatus().then((value) {
  //     if (value != null) {
  //       setState(() {
  //         _isSignedIn = value;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     theme:   ThemeData(
      primaryColor: Constant().primaryColor  ,
      scaffoldBackgroundColor: Colors.white
     ),
      debugShowCheckedModeBanner: false,
      // Show HomePage when the user is NOT signed in per request
      // home: !_isSignedIn ? HomePage() : Loginpage(),
      home: Loginpage(),
    );
  }
}

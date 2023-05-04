import 'package:firebase_core/firebase_core.dart';
import 'package:groupchat/helper/helper_funtion.dart';
import 'package:groupchat/pages/auth/login_page.dart';
import 'package:groupchat/pages/home_page.dart';
import 'package:groupchat/shared/constants.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggetInStatus();
  }

  getUserLoggetInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Constants().primaryColor,
            scaffoldBackgroundColor: Colors.white),
        home: _isSignedIn ? HomePage() : LoginPage());
  }
}

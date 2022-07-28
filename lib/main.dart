import 'package:flutter/material.dart';
import 'package:meets_on_flutter/BottomTabPage.dart';
import 'package:meets_on_flutter/FriendsTabPage.dart';
import 'package:meets_on_flutter/LoginPage.dart';
import 'SplashPage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meets',
      // home: SplashPage(),
      home: BottomTabPage(),
      // routes: <String, WidgetBuilder>{
      //   '/login': (BuildContext context) => LoginPage(),
      //   '/friends': (BuildContext context) => FriendsTabPage(),
      // },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:meets_on_flutter/BottomTabPage.dart';
import 'package:meets_on_flutter/hexColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meets',
      theme: ThemeData(
        // HexColor('00ced1')
        primarySwatch: Colors.red,
      ),
      // home: const MyHomePage(title: 'Meets'),
      home: BottomTabPage()
    );
  }
}


import 'package:flutter/material.dart';
import 'package:meets_on_flutter/ChatTabPage.dart';
import 'package:meets_on_flutter/FriendsTabPage.dart';

class BottomTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabPage();
  }
}

class _BottomTabPage extends State<BottomTabPage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    FriendsTabPage(),
    ChatTabPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meets'),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // textではなくて、labelにしないとダメらしい
          BottomNavigationBarItem(icon: Icon(Icons.child_friendly),label: 'Friends',),
          BottomNavigationBarItem(icon: Icon(Icons.phone_in_talk), label: 'Chat')
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
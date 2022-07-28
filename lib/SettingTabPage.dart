import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FirebaseAuthをインスタンス化
    final user = FirebaseAuth.instance;
    return Scaffold(
      body: Container(
        child: SeparatedList(),
      ),
    );
  }

  // 区切り線ありのリスト
  Widget SeparatedList() {
    final setting_list = ["アカウント設定","aaa"];
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // １件のアイテムについて
          return settingItem(setting_list[index]);
        },
        separatorBuilder: (context, index) {
          // リストのセパレータについて
          return separatorItem();
        },
        itemCount: setting_list.length,
    );
  }

  //　区切りのスタイル
  Widget separatorItem() {
    return Container(
      height: 20,
      color: Colors.orange,
    );
  }

  //
  Widget settingItem(String title) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width:  3.0, color: Colors.green))
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

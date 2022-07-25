import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Center(
          child: Row(
        children: [
          ElevatedButton(
              child: const Text('FireStore register'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await _firestore.collection('User') // コレクションID
                    .add({'name': 'aaa'}); //　ドキュメントIDは自動採番
                // final document = <String,dynamic>{
                //   'createdAt':Timestamp.fromDate(DateTime.now())
                // };
                // FirebaseFirestore.instance.collection('test').doc('dedmo').set(document).then((value) => print('add document complete!')).catchError((e) => print(e));
              }),
        ],
      )),
    );
  }
}

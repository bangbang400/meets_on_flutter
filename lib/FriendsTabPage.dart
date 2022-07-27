import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsTabPage extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {

    // 非同期処理を実行する
    var future = getDocId();
    future.then((value) => print("get ${value}"));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('title'),
      // ),
      body: Center(
        child:
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['user_Name']),
                  // subtitle: Text(data['user_name']),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

// Future (単体の非同期データを扱う場合）
// Stream (複数の非同期データを扱う場合）
Future<DocumentReference<Map<String, dynamic>>?> getDocId() async {
  // 現在のユーザ情報を取得する
  String uid = FirebaseAuth.instance.currentUser!.uid;
  // print(FirebaseFirestore.instance.collection('Users').doc(uid).collection('Friends').doc().id);
  List<DocumentSnapshot> docList = [];
  final snapshot = await FirebaseFirestore.instance.collection('Users').doc(uid).collection('Friends');
  //友達リストを表示する
  return snapshot.parent;
}


// ↓memo↓
// child: Text("Friends",style: TextStyle(fontSize: 20),),
//
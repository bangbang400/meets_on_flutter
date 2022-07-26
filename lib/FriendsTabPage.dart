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

Future<List> getDocId() async {
  // 現在のユーザ情報を取得する
  var user = FirebaseAuth.instance.currentUser;
  List docList = [];

  //現在ログインしているユーザを取得して友達リストを表示する
  await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Friends').get().then(
        (QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach(
            (doc) {
          docList.add(doc.id);
        },
      ),
    },
  );
  return docList;
}


// ↓memo↓
// child: Text("Friends",style: TextStyle(fontSize: 20),),
//
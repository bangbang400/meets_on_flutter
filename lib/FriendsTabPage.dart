import 'package:flutter/material.dart';

class FriendsTabPage extends StatelessWidget {
  // ダミーデータ
  final List<Map<String, dynamic>> listItems = [
    {
      'text': '山田　太郎',
      'color': Colors.blue,
    },
    {
      'text': '山田　花子',
      'color': Colors.blue,
    },
    {
      'text': '山田　二郎',
      'color': Colors.blue,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugリボンを削除する
      debugShowCheckedModeBanner: false,
      // backgroundColor: Colors.orange,
      // title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Column(children: <Widget>[
          Container(
            height: 300,
            // EdgeInsets.all(4)：枠の上下左右全ての方向に同じ余白を作
            // padding: EdgeInsets.all(0),
            // 配列を元にリスト表示
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return Container(
                  // margin: EdgeInsets.only(left:width*0.05),
                  height: 100,
                  // color: listItems[index]['color'],
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/image_test.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(listItems[index]['text']),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

// ↓memo↓
// child: Text("Friends",style: TextStyle(fontSize: 20),),
//
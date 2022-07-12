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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            reverse: true, // リストを下から生成する
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              var data = listItems[index];
              return Container(
                child: ListTile(
                  title: Text(data['text']),
                ),
              );
              // return Container(
              //   // margin: EdgeInsets.only(left:width*0.05),
              //   height: 100,
              //   // color: listItems[index]['color'],
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage('images/image_test.png'),
              //         fit: BoxFit.fill,
              //       ),
              //       shape: BoxShape.circle
              //   ),
              //   child: Text(listItems[index]['text']),
              // );
            },
          ),
        ),
      ),
    );
  }
}
// ↓memo↓
// child: Text("Friends",style: TextStyle(fontSize: 20),),
//
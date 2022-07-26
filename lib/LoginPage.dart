import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meets_on_flutter/BottomTabPage.dart';
import 'package:meets_on_flutter/FriendsTabPage.dart';

// ログインページのウィジェット
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String infoText = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  // メッセージを表示する
                  child: Text(infoText),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('ユーザ登録'),
                    onPressed: () async {
                      try {
                        // メールアドレスとパスワードで登録
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                        // 登録成功した場合、友達画面に遷移＋ログイン画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context){
                            return BottomTabPage();
                        }),
                        );
                      }catch(e){
                        // ユーザ登録に失敗した場合
                        setState(() {
                          infoText = "登録に失敗しました:${e.toString()}";
                        });
                        print("登録に失敗しました:${e.toString()}");
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  // ログイン登録ボタン
                  child: OutlinedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      try {
                        // メールアドレス/パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                        );
                        // ログインに成功した場合
                        // ログイン成功した場合、友達画面に遷移＋ログイン画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return FriendsTabPage();
                        }
                        ),);
                      } catch (e) {
                        // ログインに失敗した場合
                        setState(() {
                          infoText = "ログインに失敗しました:${e.toString()}";
                          print("ログインに失敗しました:${e.toString()}");
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}



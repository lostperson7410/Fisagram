import 'package:flutter/material.dart';
import 'package:ig/loginPage.dart';
import 'loginPage.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Before examp",
      home: RootPage(auth: Auth(),)
      /* MyMainPage(),*/
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ig/auth.dart';
import 'auth.dart';
import 'storyline.dart';





var secondSection = Container(color: Colors.pink,width: 200,);
var thirdSection = Container(color: Colors.amber,width: 200,);


class HomePage extends StatelessWidget{
  HomePage({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;


  void _signOut()async{
    try{
      await auth.signOut();
      onSignedOut();
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("test programming"),
        actions: <Widget>[
          FlatButton(onPressed: _signOut, child: Text('Logout'))
        ],

      ),
      body: PageView(scrollDirection: Axis.horizontal,
        children: <Widget>[
          FirstSection(),
          secondSection,
          thirdSection,
        ],
      ),
    );
  }
  }




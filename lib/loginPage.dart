import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'auth.dart';
import 'root_page.dart';

class Mainlogin extends StatefulWidget {
  Mainlogin({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  _StateLogin createState() => _StateLogin();
}

enum FormType{
  login,
  register
}

class _StateLogin extends State<Mainlogin> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;



  bool validateAndSave(){
final form = formKey.currentState;
if(form.validate()){
  form.save();
return true;
}else{
return false;
}
  }
  void validateAndSubmit() async{
    if(validateAndSave()){
      try {
        if(_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId.uid');
        }else{
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print('register: $userId.uid');
        }
        widget.onSignedIn();
      }
      catch(e){
        print("Error: $e");
      }
    }
  }


  void moveToRegister(){
    formKey.currentState.reset();
  setState(() {
    _formType = FormType.register;

  });
  }

  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
          color: Colors.amber,
          child: Form(
            key: formKey,
            child: Column(
              children: buildInputs() + buildSubmitButtons(),
            ),
          )),
    );
  }

  List<Widget> buildInputs(){
    return [
      TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        validator: (value) => value.isEmpty? 'Emain can\'t be empty': null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: "Password"),
        obscureText: true,
        validator: (value) => value.isEmpty? 'Password can\'t be empty': null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login){
      return [
        RaisedButton(child: Text("Login"), onPressed: validateAndSubmit,),
        FlatButton(onPressed: moveToRegister, child: Text("Create Account "))
      ];
       }else{
      return [
        RaisedButton(child: Text("Create Account"), onPressed: validateAndSubmit,),
        FlatButton(onPressed: moveToLogin, child: Text("Already have an Account "))
      ];

    }
  }
}

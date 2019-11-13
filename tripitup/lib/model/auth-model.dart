import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripitup/main.dart';

class AuthModel{

  void siginInWithFirebase(BuildContext context, String email, String pass)async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then((AuthResult fuser){
      print(fuser.user.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
    }).catchError((e){
      print(e);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Failed to Login"),
            content: Text(e.message),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Okay"),
              )
            ],
          );
        }
      );
    });
  }

  void signupWithEmailAndPassword(BuildContext context, String email, String pass)async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((AuthResult res){
      print(res.user.uid);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
    }).catchError((e){
      print(e);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Failed to Login"),
            content: Text(e.message),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Okay"),
              )
            ],
          );
        }
      );
    });
  }

}
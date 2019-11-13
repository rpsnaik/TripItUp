import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripitup/view/auth.dart';
import 'package:tripitup/view/home.dart';

void main(){
  runApp(
    MaterialApp(
      home: SplashScreen(),
    )
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(
      milliseconds: 500
    ), ()async{
      FirebaseUser fUser = await FirebaseAuth.instance.currentUser();
      if(fUser == null){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>AuthPage()
        ));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Trip It Up", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
        ),),
      ),
    );
  }
}
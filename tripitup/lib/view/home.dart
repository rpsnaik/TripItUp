import 'package:flutter/material.dart';
import 'package:tripitup/view/chatbot.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBot()));
                },
                child: Text("Chat bot", style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
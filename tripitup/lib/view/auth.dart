import 'package:flutter/material.dart';
import 'package:tripitup/model/auth-model.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text("Trip It Up", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Sign in", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                    ),),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      onSaved: (String val){
                        email = val.trim();
                      },
                      validator: (String val){
                        if(val.length < 5){
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      onSaved: (String val){
                        password= val;
                      },
                      validator: (String val){
                        if(val.length < 5){
                          return 'Please Enter valid Password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            AuthModel authModel = AuthModel();
                            authModel.siginInWithFirebase(context, email, password);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Sign in", style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        )
                      ),
                    )


                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account - "),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>SignupPage()
                          ));
                        },
                        child: Text("Click here", style: TextStyle(
                          color: Colors.blue
                        ),),
                      )
                    ],
                  )

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text("Trip It Up", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Sign Up", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                    ),),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      onSaved: (String val){
                        email = val.trim();
                      },
                      validator: (String val){
                        if(val.length < 5){
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      onSaved: (String val){
                        password= val;
                      },
                      validator: (String val){
                        if(val.length < 5){
                          return 'Please Enter valid Password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            AuthModel authModel = AuthModel();
                            authModel.signupWithEmailAndPassword(context, email, password);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Create Account", style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        )
                      ),
                    )


                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an Account ? - "),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text("Click here", style: TextStyle(
                          color: Colors.blue
                        ),),
                      )
                    ],
                  )

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  PageController pctrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: pctrl,
          children: <Widget>[
            GetIntrest(pctrl: pctrl,),
            GetCoutOfUsers(pctrl: pctrl,),
            // GetLocationOfTheTrip(),
            // GetTripStartTime(),
            // GetTripEndTime()
          ],
        ),
      ),
    );
  }
}

class GetIntrest extends StatefulWidget {
  final PageController pctrl;
  GetIntrest({@required this.pctrl});
  @override
  _GetIntrestState createState() => _GetIntrestState();
}

class _GetIntrestState extends State<GetIntrest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("Hello! Up for a trip ?", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0
          ),),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: (){
                  widget.pctrl.nextPage(duration: Duration(
                    milliseconds: 500,
                  ), curve: Curves.easeInOut);
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Text("Yes"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Text("No"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GetCoutOfUsers extends StatefulWidget {
  final PageController pctrl;
  GetCoutOfUsers({@required this.pctrl});
  @override
  _GetCoutOfUsersState createState() => _GetCoutOfUsersState();
}

class _GetCoutOfUsersState extends State<GetCoutOfUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("How many people are going for the trip!"),
          Container(
            padding: EdgeInsets.all(30.0),
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i){
                return Container(
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Text((i+1).toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
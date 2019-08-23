import 'package:flutter/material.dart';

class LeaveApproval extends StatefulWidget {
  @override
  _LeaveApprovalState createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int position) {
                return new Text("item " + position.toString());
              },
              itemCount: 5,
            ),


          ),
        ],
      ),
    );
  }
}

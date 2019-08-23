import 'package:flutter/material.dart';
import 'package:hrpayroll/ui/Home/Home.dart';
import './Leave.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Text("HR Payroll",
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.redAccent
            ),
          ),

          new ListTile(
            title: new Text("Dashboard"),
            leading: new Icon(Icons.home),
            onTap: () => debugPrint("Dashboard"),
          ),

          new ListTile(
            title: new Text("Home"),
            leading: new Icon(Icons.format_list_bulleted),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                return new Home();
              }));
            },
          ),

          new ListTile(
            title: new Text("Leaves"),
            leading: new Icon(Icons.transfer_within_a_station),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                return new Leave();
              }));
            },
          ),

          new ListTile(
            title: new Text("Training"),
            leading: new Icon(Icons.work),
            onTap: () => debugPrint("Training"),
          ),

          new ListTile(
            title: new Text("Employee Asset"),
            leading: new Icon(Icons.person),
            onTap: () => debugPrint("Emp Asset"),
          ),

          new ListTile(
            title: new Text("Passport"),
            leading: new Icon(Icons.flight_takeoff),
            onTap: () => debugPrint("Passport"),
          ),

          new ListTile(
            title: new Text("Info"),
            leading: new Icon(Icons.info_outline),
            onTap: () => debugPrint("Info"),
          ),

          new ListTile(
            title: new Text("Help"),
            leading: new Icon(Icons.help_outline),
            onTap: () => debugPrint("Help"),
          ),

          new ListTile(
            title: new Text("Log Out"),
            leading: new Icon(Icons.exit_to_app),
            onTap: () => debugPrint("Log Out"),
          ),
        ],
      ),
    );
  }
}

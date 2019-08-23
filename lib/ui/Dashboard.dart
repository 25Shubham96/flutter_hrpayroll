import 'package:flutter/material.dart';
import './MyAppBar.dart';
import './MyDrawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar.getAppBar("Welcome"),
      drawer: new MyDrawer(),
    );
  }
}

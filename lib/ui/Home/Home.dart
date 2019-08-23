import 'package:flutter/material.dart';
import '../MyDrawer.dart';
import './EmployeeMaster.dart';
import './LeaveApproval.dart';
import './TrainingApproval.dart';
import './AssessmentApproval.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Employee Master",),
              Tab(text: "Leave Approval",),
              Tab(text: "Training Approval",),
              Tab(text: "Assesment Approval",),
              Tab(text: "Passport Approval",),
            ],
            isScrollable: true,
          ),
          title: new Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: TabBarView(children: [
          new EmployeeMaster(),
          new LeaveApproval(),
          new TrainingApproval(),
          new AssessmentApproval(),
          new Icon(Icons.exit_to_app),
        ]),
      ),
    );
  }
}

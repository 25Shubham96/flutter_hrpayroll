import 'package:flutter/material.dart';
import './TabbedAppBar.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {

  List<Tab> tabs = List<Tab>();
  List<Widget> tabContent = List<Widget>();
  @override
  Widget build(BuildContext context) {
    tabs.add(new Tab(text: "Leave Master",));
    tabs.add(new Tab(text: "Leave Application",));
    tabs.add(new Tab(text: "Compansatory Off",));
    tabs.add(new Tab(text: "Out of Office",));
    tabs.add(new Tab(text: "Business Trip",));
    tabs.add(new Tab(text: "Approve List",));

    tabContent.add(new Icon(Icons.format_list_bulleted));
    tabContent.add(new Icon(Icons.g_translate));
    tabContent.add(new Icon(Icons.http));
    tabContent.add(new Icon(Icons.info_outline));
    tabContent.add(new Icon(Icons.format_align_justify));
    tabContent.add(new Icon(Icons.keyboard));

    return TabAppBar.getTabbedAppBar("Leave Request", tabs, tabContent);
  }
}

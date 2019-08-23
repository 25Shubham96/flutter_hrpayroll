import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hrpayroll/DataSource/EmployeeMasterDataSource.dart';
import './EmpMasterDataSource.dart';
import 'package:hrpayroll/response_model/EmployeeMasterResponse.dart';

class EmployeeMaster extends StatefulWidget {
  @override
  _EmployeeMasterState createState() => _EmployeeMasterState();
}

class _EmployeeMasterState extends State<EmployeeMaster> {
  EmpMasterDataSource empMasterDataSource = EmpMasterDataSource();

  static List<EmployeeMasterModel> newdata = new List();

  EmployeeMasterDataSource _employeeMasterDataSource = EmployeeMasterDataSource(
      newdata);

  EmployeeMasterResponse _myResponseData;

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  void getEmployeeMasterResponse() async {
    _myResponseData = await getEmpData();
    setState(() {
      _employeeMasterDataSource =
          EmployeeMasterDataSource(_myResponseData.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.all(10),
              child: new Column(
                children: <Widget>[
                  new Center(
                    child: new Text(
                      "Employee Master View",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            showAction(context);
                          },
                          child: new Row(
                            children: <Widget>[
                              new Text("Action"),
                              new Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          color: Colors.grey.shade300,
                        ),
                        new Padding(padding: new EdgeInsets.only(left: 10)),
                        new FlatButton(
                          onPressed: () {
                            showNavigation(context);
                          },
                          child: new Row(
                            children: <Widget>[
                              new Text("Navigate"),
                              new Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            FutureBuilder(
              future: getEmpData(),
              builder: (BuildContext context,
                  AsyncSnapshot<EmployeeMasterResponse> snapshot) {
                if (snapshot.hasData) {
                  EmployeeMasterResponse _myResponseData = snapshot.data;
                  _employeeMasterDataSource =
                      EmployeeMasterDataSource(_myResponseData.data);
                  return PaginatedDataTable(
                    columnSpacing: 15,
                    horizontalMargin: 15,
                    headingRowHeight: 35,
                    dataRowHeight: 30,
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    header: new Text(""),
                    columns: [
                      DataColumn(label: new Text("Emp No")),
                      DataColumn(label: new Text("First Name")),
                      DataColumn(label: new Text("Last Name")),
                      DataColumn(label: new Text("Grade/Pay Cadre")),
                      DataColumn(label: new Text("Employment Date")),
                      DataColumn(label: new Text("Sponser")),
                      DataColumn(label: new Text("Location")),
                      DataColumn(label: new Text("Post to GL")),
                      DataColumn(
                          label: new Text("Entitled for Dependent Flight")),
                      DataColumn(
                          label: new Text("Entitled for Dependent Insuarence")),
                      DataColumn(label: new Text("Resigned")),
                      DataColumn(label: new Text("Termination")),
                      DataColumn(label: new Text("City")),
                      DataColumn(label: new Text("Country Code")),
                      DataColumn(label: new Text("Designation")),
                      DataColumn(label: new Text("Status")),
                      DataColumn(label: new Text("Period Start Date")),
                      DataColumn(label: new Text("Period End Date")),
                      DataColumn(label: new Text("Department Code")),
                      DataColumn(label: new Text("Emp Posting Group")),
                      DataColumn(label: new Text("Bus Posting Group")),
                      DataColumn(label: new Text("Probation")),
                      DataColumn(label: new Text("Employee Code")),
                      DataColumn(label: new Text("Location Code")),
                      DataColumn(label: new Text("Job Title")),
                      DataColumn(label: new Text("Operation Type")),
                    ],
                    source: _employeeMasterDataSource,
                  );
                }
                else {
                  return PaginatedDataTable(
                    columnSpacing: 15,
                    horizontalMargin: 15,
                    headingRowHeight: 35,
                    dataRowHeight: 30,
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    header: new Text(""),
                    columns: [
                      DataColumn(label: new Text("Emp No")),
                      DataColumn(label: new Text("First Name")),
                      DataColumn(label: new Text("Last Name")),
                      DataColumn(label: new Text("Grade/Pay Cadre")),
                      DataColumn(label: new Text("Employment Date")),
                      DataColumn(label: new Text("Sponser")),
                      DataColumn(label: new Text("Location")),
                      DataColumn(label: new Text("Post to GL")),
                      DataColumn(
                          label: new Text("Entitled for Dependent Flight")),
                      DataColumn(
                          label: new Text("Entitled for Dependent Insuarence")),
                      DataColumn(label: new Text("Resigned")),
                      DataColumn(label: new Text("Termination")),
                      DataColumn(label: new Text("City")),
                      DataColumn(label: new Text("Country Code")),
                      DataColumn(label: new Text("Designation")),
                      DataColumn(label: new Text("Status")),
                      DataColumn(label: new Text("Period Start Date")),
                      DataColumn(label: new Text("Period End Date")),
                      DataColumn(label: new Text("Department Code")),
                      DataColumn(label: new Text("Emp Posting Group")),
                      DataColumn(label: new Text("Bus Posting Group")),
                      DataColumn(label: new Text("Probation")),
                      DataColumn(label: new Text("Employee Code")),
                      DataColumn(label: new Text("Location Code")),
                      DataColumn(label: new Text("Job Title")),
                      DataColumn(label: new Text("Operation Type")),
                    ],
                    source: _employeeMasterDataSource,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<EmployeeMasterResponse> getEmpData() async {
  String apiURL = "http://103.1.92.74:8098/api/employeesapi/getemployees";

  var response = await http.get(
    apiURL,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Basic 9D3DD97C8C434A57874062AE0121D4C1'
    },
  );

  return employeeMasterFromJson(response.body);
}

void showAction(BuildContext context) {
  var alert = AlertDialog(
    title: Text("Action"),
    content: new Container(
      height: 448,
      child: new Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assessment),
            title: new Text("Assesment Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.adjust),
            title: new Text("Comp Off Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: new Text("Business Trip Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: new Text("Out of Office Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.transfer_within_a_station),
            title: new Text("Leave Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: new Text("Training Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: new Text("Emp Asset Sanc Incharge"),
          ),
          ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: new Text("Passport Sanc Incharge"),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (context) {
    return alert;
  });
}

void showNavigation(BuildContext context) {
  var alert = AlertDialog(
    title: Text("Navigate"),
    content: new Container(
      height: 392,
      child: new Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.group),
            title: new Text("Kins"),
          ),
          ListTile(
            leading: Icon(Icons.compare_arrows),
            title: new Text("Shifts"),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: new Text("Designation"),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: new Text("Location History"),
          ),
          ListTile(
            leading: Icon(Icons.fast_forward),
            title: new Text("Carry Forward Info"),
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: new Text("KRA"),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: new Text("Pay Elements"),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (context) {
    return alert;
  });
}

import 'package:flutter/material.dart';
import 'package:hrpayroll/Network/ApiInterface.dart';
import 'package:hrpayroll/request_model/LeaveMasterRequest.dart';
import 'package:hrpayroll/response_model/EmployeeMasterResponse.dart';
import 'package:hrpayroll/response_model/LeaveMasterResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './MyAppBar.dart';
import './MyDrawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  void enterEmpDetailsToSharedPref(List<String> empNo,
      List<String> empName,
      List<String> empDesignation,
      List<String> empDepartment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("empNo", empNo);
    sharedPreferences.setStringList("empName", empName);
    sharedPreferences.setStringList("empDesignation", empDesignation);
    sharedPreferences.setStringList("empDepartment", empDepartment);
  }

  void enterLeaveDetailsToSharedPref(List<String> leaveCode,
      List<String> leaveDescription) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("leaveCode", leaveCode);
    sharedPreferences.setStringList("leaveDescription", leaveDescription);
  }

  ApiInterface _apiInterface1 = ApiInterface();
  ApiInterface _apiInterface2 = ApiInterface();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar.getAppBar("Welcome"),
      drawer: new MyDrawer(),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _apiInterface1.getEmpData(),
            builder: (BuildContext context, AsyncSnapshot<EmployeeMasterResponse> snapshot) {
              if(snapshot.hasData) {
                EmployeeMasterResponse employeeMasterResponse = snapshot.data;
                if(employeeMasterResponse.status) {
                  List<String> empNo = List();
                  List<String> empName = List();
                  List<String> empDesignation = List();
                  List<String> empDepartment = List();

                  for(int i = 0 ; i < employeeMasterResponse.data.length ; i++) {
                    empNo.add(employeeMasterResponse.data[i].no);
                    empName.add(employeeMasterResponse.data[i].firstName + " " + employeeMasterResponse.data[i].lastName);
                    empDesignation.add(employeeMasterResponse.data[i].designation);
                    empDepartment.add(employeeMasterResponse.data[i].departmentCode);
                  }
                  enterEmpDetailsToSharedPref(empNo, empName, empDesignation, empDepartment);
                }
                return Container();
              }
              else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: _apiInterface2.LeaveMasterResponseData(
                LeaveMasterRequest(
                  action: 1,
                )
            ),
            builder: (BuildContext context, AsyncSnapshot<LeaveMasterResponse> snapshot) {
              if(snapshot.hasData) {
                LeaveMasterResponse _myResponseData = snapshot.data;
                if(_myResponseData.status) {
                  List<String> leaveCode = List();
                  List<String> leaveDescription = List();

                  for(int i = 0 ; i < _myResponseData.data.length ; i++) {
                    leaveCode.add(_myResponseData.data[i].leaveCode);
                    leaveDescription.add(_myResponseData.data[i].description);
                  }
                  enterLeaveDetailsToSharedPref(leaveCode, leaveDescription);
                }
                return Center(child: Text("Welcome to Dashboard"),);
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                    Center(child: Text("Welcome to Dashboard"),),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}

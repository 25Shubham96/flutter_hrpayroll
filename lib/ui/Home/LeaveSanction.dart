import 'package:flutter/material.dart';
import 'package:hrpayroll/DataSource/ActionDataSource.dart';
import 'package:hrpayroll/Network/ApiInterface.dart';
import '../MyAppBar.dart';
import 'package:hrpayroll/response_model/ActionResponse.dart';
import 'package:hrpayroll/request_model/ActionRequest.dart';

class LeaveSanction extends StatelessWidget {

  String EmpNo;

  LeaveSanction(this.EmpNo);
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  ApiInterface _apiInterface;

  static List<ActionResponseModel> newdata = new List();
  ActionDataSource _actionDataSource = ActionDataSource(newdata);

  @override
  Widget build(BuildContext context) {

    ActionRequest actionRequest = ActionRequest(
      action: 1,
      employeeId: EmpNo,
    );

    return Scaffold(
      appBar: MyAppBar.getAppBar("Leave Sanction ("+EmpNo+")"),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _apiInterface.LeaveSanctionResponseData(actionRequest),
              builder: (BuildContext context, AsyncSnapshot<ActionResponse> snapshot) {
              if(snapshot.hasData && snapshot.data.status) {
                ActionResponse _actionResponseData = snapshot.data;
                _actionDataSource = ActionDataSource(_actionResponseData.data);
                return PaginatedDataTable(
                  columnSpacing: 15,
                  horizontalMargin: 15,
                  headingRowHeight: 35,
                  dataRowHeight: 30,
                  rowsPerPage: _rowsPerPage,
                  header: Text(""),
                  columns: [
                    DataColumn(label: Text("Employee Id")),
                    DataColumn(label: Text("Sanction Incharge")),
                    DataColumn(label: Text("Hierarchy")),
                    DataColumn(label: Text("Incharge Name")),
                  ],
                  source: _actionDataSource,
                );
              }
              else {
                return PaginatedDataTable(
                  columnSpacing: 15,
                  horizontalMargin: 15,
                  headingRowHeight: 35,
                  dataRowHeight: 30,
                  rowsPerPage: _rowsPerPage,
                  header: Text(""),
                  columns: [
                    DataColumn(label: Text("Employee Id")),
                    DataColumn(label: Text("Sanction Incharge")),
                    DataColumn(label: Text("Hierarchy")),
                    DataColumn(label: Text("Incharge Name")),
                  ],
                  source: _actionDataSource,
                );
              }
            },
            )
          ],
        ),
      ),
    );
  }
}

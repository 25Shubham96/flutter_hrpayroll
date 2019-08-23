import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';
import './EmpMasterDataSource.dart';

class AssessmentApproval extends StatefulWidget {
  @override
  _AssessmentApprovalState createState() => _AssessmentApprovalState();
}

class _AssessmentApprovalState extends State<AssessmentApproval> {

  final EmpMasterDataSource _empMasterDataSource = EmpMasterDataSource();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Scrollbar(child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          /*PaginatedDataTable(
            columnSpacing: 15,
            horizontalMargin: 15,
            headingRowHeight: 35,
            dataRowHeight: 30,
            header: new Container(
              child: new Text(""),
            ),
            columns: <DataColumn>[
              DataColumn(label: new Text("Employee No")),
              DataColumn(label: new Text("First Name")),
              DataColumn(label: new Text("Last Name")),
              DataColumn(label: new Text("Date of Joining")),
            ],
            source: _empMasterDataSource,
          )*/
        ],

      )),
    );
  }
}

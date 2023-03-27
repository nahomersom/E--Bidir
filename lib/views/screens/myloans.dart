import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class MyLoansDataGrid extends StatefulWidget {
  /// Creates the home page.
  MyLoansDataGrid({Key? key}) : super(key: key);

  @override
  _MyLoansDataGridState createState() => _MyLoansDataGridState();
}

class _MyLoansDataGridState extends State<MyLoansDataGrid> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'My Loans'.toString(),
          style: _textTheme.titleLarge?.copyWith(
              color: ColorResources.accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: SfDataGrid(
        source: employeeDataSource,

        columns: <GridColumn>[
          GridColumn(
              columnName: 'bank',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Bank',
                  ))),
          GridColumn(
              columnName: 'collateral',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Collateral'))),
          GridColumn(
              columnName: 'status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Status',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'loanAmount',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Loan Amount(ETB)'))),
          GridColumn(
              columnName: 'period',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Period(Month)'))),
          GridColumn(
              columnName: 'monthlyPayment',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Monthly Payment'))),
          GridColumn(
              columnName: 'score',
              label: Container(
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text('Score'))),
          GridColumn(
              columnName: 'rank',
              label: Container(
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text('Rank'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee('Ahadu Bank', 'Car', 'Pending', '1,3423', '44', '38,21',
          '183.5', 'Good'),
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.image, this.collateral, this.status, this.loanAmount,
      this.period, this.monthlyPayment, this.score, this.rank);

  /// Id of an employee.
  final String image;

  /// Name of an employee.
  final String collateral;

  /// Designation of an employee.
  final String status;

  /// Salary of an employee.
  final String loanAmount;
  final String period;
  final String monthlyPayment;
  final String score;
  final String rank;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'image', value: e.image),
              DataGridCell<String>(
                  columnName: 'collateral', value: e.collateral),
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(
                  columnName: 'loanAmount', value: e.loanAmount),
              DataGridCell<String>(columnName: 'period', value: e.period),
              DataGridCell<String>(
                  columnName: 'monthlyPayment', value: e.monthlyPayment),
              DataGridCell<String>(
                  columnName: 'score', value: e.score),
              DataGridCell<String>(columnName: 'rank', value: e.rank),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

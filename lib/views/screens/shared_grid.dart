import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



/// The home page of the application which hosts the datagrid.
class SharedDataGrid extends StatefulWidget {
  /// Creates the home page.
  SharedDataGrid(this.arguments, {Key? key}) : super(key: key);
  Object? arguments;
  @override
  _SharedDataGridState createState() => _SharedDataGridState();
}

class _SharedDataGridState extends State<SharedDataGrid> {
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
        title:  Text('${widget.arguments} Data'.toString(),style: _textTheme.titleLarge?.copyWith(
          color: ColorResources.accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),),

      ),
      body: SfDataGrid(
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary'))),
          GridColumn(
              columnName: 'loan',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('loan'))),
          GridColumn(
              columnName: 'balance',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('balance'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000,20000,3249829892),
      Employee(10002, 'Kathryn', 'Manager', 30000,20000,3249829892),
      Employee(10003, 'Lara', 'Developer', 15000,20000,3249829892),
      Employee(10004, 'Michael', 'Designer', 15000,20000,3249829892),
      Employee(10005, 'Martin', 'Developer', 15000,20000,3249829892),
      Employee(10006, 'Newberry', 'Developer', 15000,20000,3249829892),
      Employee(10007, 'Balnc', 'Developer', 15000,20000,3249829892),
      Employee(10008, 'Perry', 'Developer', 15000,20000,3249829892),
      Employee(10009, 'Gable', 'Developer', 15000,20000,3249829892),
      Employee(10010, 'Grimes', 'Developer', 15000,20000,3249829892)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary, this.loan, this.balance);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
  final int loan;
  final int balance;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(
          columnName: 'designation', value: e.designation),
      DataGridCell<int>(columnName: 'salary', value: e.salary),
      DataGridCell<int>(columnName: 'loan', value: e.loan),
      DataGridCell<int>(columnName: 'balance', value: e.loan),
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
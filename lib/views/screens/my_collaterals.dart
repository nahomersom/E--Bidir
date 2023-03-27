import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



/// The home page of the application which hosts the datagrid.
class MyCollateralsDataGrid extends StatefulWidget {
  /// Creates the home page.
  MyCollateralsDataGrid({Key? key}) : super(key: key);

  @override
  _MyCollateralsDataGridState createState() => _MyCollateralsDataGridState();
}

class _MyCollateralsDataGridState extends State<MyCollateralsDataGrid> {
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
        title:  Text('My Collaterals'.toString(),style: _textTheme.titleLarge?.copyWith(
            color: ColorResources.accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 24
        ),),

      ),
      body: SfDataGrid(
        source: employeeDataSource,
        isScrollbarAlwaysShown:true,



        columns: <GridColumn>[
          GridColumn(
              columnName: 'image',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Image',
                  ))),
          GridColumn(
              columnName: 'vehicleType',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Type Of Vehicle'))),
          GridColumn(
              columnName: 'vehicleBrand',
              minimumWidth: 130,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Brand Of Vehicle',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'vehicleModel',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Model Of Vehicle'))),
          GridColumn(
              columnName: 'plateNumber',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('loan'))),
          GridColumn(
              columnName: 'Mileage',
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
      Employee('not available', 'Hatchback', 'Toyota', 'AA232323','xkj3432','272637km'),
      Employee('not available', 'CrossOver', 'Hyundai', 'OR232323','a3432','972637km'),
      Employee('not available', 'Hatchback', 'Suzuki', 'AA232323','xkj3432','272637km'),

    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.image, this.vehicleType, this.vehicleBrand, this.vehicleModel, this.plateNumber, this.mileage);

  /// Id of an employee.
  final String image;

  /// Name of an employee.
  final String vehicleType;

  /// Designation of an employee.
  final String vehicleBrand;

  /// Salary of an employee.
  final String vehicleModel;
  final String plateNumber;
  final String mileage;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'image', value: e.image),
      DataGridCell<String>(columnName: 'vehicleType', value: e.vehicleType),
      DataGridCell<String>(
          columnName: 'vehicleBrand', value: e.vehicleBrand),
      DataGridCell<String>(columnName: 'vehicleModel', value: e.vehicleModel),
      DataGridCell<String>(columnName: 'plateNumber', value: e.plateNumber),
      DataGridCell<String>(columnName: 'mileage', value: e.mileage),
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
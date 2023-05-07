import 'package:e_bidir/bloc/collateral/collaterals_bloc.dart';
import 'package:e_bidir/bloc/my_loan/my_loan_bloc.dart';
import 'package:e_bidir/data/api/api_client.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../bloc/banks/banks_bloc.dart';
import '../../data/model/car.dart';
import '../../data/model/my_loan/my_loan_info.dart';
import '../../repositories/bank_repo.dart';
import '../../repositories/user_repo.dart';
import 'coallateral_detail.dart';

int currentIndex = 0;

/// The home page of the application which hosts the datagrid.

class CollateralsDataGrid extends StatefulWidget {
  @override
  State<CollateralsDataGrid> createState() => _CollateralsDataGridState();
}

class _CollateralsDataGridState extends State<CollateralsDataGrid> {
  // List<Employee> employees = <Employee>[];
  CollateralDataSource employeeDataSource = CollateralDataSource(myCarData: []);

  // employees = getEmployeeData();
  List<String> myCollaterals = ['Cars', 'Buildings'];

  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return RepositoryProvider(
      create: (context) => UserRepo(apiClient: ApiClient()),
      child: BlocProvider<CollateralsBloc>(
        create: (BuildContext context) =>
            CollateralsBloc(collateralsRepo: context.read<UserRepo>())
              ..add(GetCollaterals()),
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        size: 26.0,
                      ),
                    ))
              ],
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.transparent,
              title: Text(
                'My Collaterals'.toString(),
                style: _textTheme.titleLarge?.copyWith(
                    color: ColorResources.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            body: BlocConsumer<CollateralsBloc, CollateralsState>(
              listener: (BuildContext context, state) {
                if (state.status.hasError) {
                  showSnackBar(context, state, _textTheme);
                }
              },
              builder: (BuildContext context, state) {
                state.status.isSuccess
                    ? employeeDataSource = CollateralDataSource(
                        myCarData: currentIndex == 0
                            ? state.carsList
                            : state.buildingList)
                    : null;
                return state.status.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                                child: Text(
                                  'Cars',
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = 1;
                                    });
                                  },
                                  child: Text('Buildings'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SfDataGrid(
                              allowSorting: true,
                              allowMultiColumnSorting: true,
                              allowFiltering: true,
                              frozenColumnsCount: 1,
                              selectionMode: SelectionMode.none,
                              columnWidthMode: ColumnWidthMode.auto,
                              source: employeeDataSource,
                              columns: <GridColumn>[
                                GridColumn(
                                    columnName: 'Image',
                                    columnWidthMode: ColumnWidthMode.fill,
                                    label: Container(
                                        width: 2,
                                        padding: EdgeInsets.all(3),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Image',
                                        ))),
                                GridColumn(
                                    columnName: 'Detail',
                                    label: Container(
                                        padding: EdgeInsets.all(1.0),
                                        alignment: Alignment.center,
                                        child: Text('Detail'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Type_of_Vehicle'
                                        : 'Type_of_Building',
                                    label: Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Type Of Vehicle'
                                            : 'Type Of Building'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Brand_of_Vehicle'
                                        : 'Total_Area',
                                    label: Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          currentIndex == 0
                                              ? 'Brand of Vehicle'
                                              : 'Total Area',
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Model_of_Vehicle'
                                        : 'Location',
                                    label: Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Model Of Vehicle'
                                            : 'Location'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Plate_Number'
                                        : 'Distance_from_Main_Road',
                                    label: Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Plate Number'
                                            : 'Distance From Main Road'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Mileage'
                                        : 'Purpose_of_the_Building',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Mileage'
                                            : 'Purpose Of The Building'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Year_of_Manufacture'
                                        : 'Construction_Status',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Year Of Manufacture'
                                            : 'Construction Status'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Country_of_Manufacture'
                                        : 'utility',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Country Of Manufacturer'
                                            : 'utility'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Number_of_Cylinders'
                                        : 'Collateral_Coverage_Ratio',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Number of Cylinders'
                                            : 'Collateral Coverage Ratio'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'Horsepower'
                                        : 'Building_Score',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'Horsepower'
                                            : 'Building Score'))),
                                GridColumn(
                                    columnName: currentIndex == 0
                                        ? 'carScore'
                                        : 'blueprintId',
                                    label: Container(
                                        padding: EdgeInsets.all(10.0),
                                        alignment: Alignment.center,
                                        child: Text(currentIndex == 0
                                            ? 'carScore'
                                            : 'Blue Print Id')))
                              ],
                            ),
                          )
                        ],
                      );
              },
            )),
      ),
    );
  }

  void showSnackBar(context, state, _textTheme) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: ColorResources.errorText,
        content: Center(
            child: Text(state.errorMessage ?? '',
                style: _textTheme.titleSmall?.copyWith(color: Colors.white)))));
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class CollateralDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  CollateralDataSource({required List<dynamic> myCarData}) {
    _employeeData = myCarData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // DataGridCell<String>(columnName: 'Image', value:  e.carImage.isNotEmpty ? 'yes image':'no image'),
              DataGridCell<Widget>(columnName: 'Detail', value: null),
              DataGridCell<String>(
                  columnName: 'Image',
                  value: currentIndex != 0
                      ? "building"
                      : e.carImage == null || e.carImage.length <= 0
                          ? null
                          : e.carImage?.first?["url"]),
              DataGridCell<String>(
                  columnName: currentIndex == 0
                      ? 'Type_of_Vehicle'
                      : 'Type_of_Building',
                  value: currentIndex == 0
                      ? e.Type_of_Vehicle.toString()
                      : e.Type_of_Building.toString()),
              DataGridCell<String>(
                  columnName:
                      currentIndex == 0 ? 'Brand_of_Vehicle' : 'Total_Area',
                  value: currentIndex == 0
                      ? e.Brand_of_Vehicle.toString()
                      : e.Total_Area.toString()),
              DataGridCell<String>(
                  columnName:
                      currentIndex == 0 ? 'Model_of_Vehicle' : 'Location',
                  value: currentIndex == 0
                      ? e.Model_of_Vehicle.toString()
                      : e.Location.toString()),
              DataGridCell<String>(
                  columnName: currentIndex == 0
                      ? 'Plate_Number'
                      : 'Distance_from_Main_Road',
                  value: currentIndex == 0
                      ? e.Plate_Number.toString()
                      : e.Distance_from_Main_Road.toString()),
              DataGridCell<String>(
                  columnName:
                      currentIndex == 0 ? 'Mileage' : 'Purpose_of_the_Building',
                  value: currentIndex == 0
                      ? e.Mileage.toString()
                      : e.Purpose_of_the_Building.toString()),

              DataGridCell<String>(
                  columnName: currentIndex == 0
                      ? 'Year_of_Manufacture'
                      : 'Construction_Status',
                  value: currentIndex == 0
                      ? e.Year_of_Manufacture.toString()
                      : e.Construction_Status.toString()),

              DataGridCell<String>(
                  columnName:
                      currentIndex == 0 ? 'Country_of_Manufacture' : 'utility',
                  value: currentIndex == 0
                      ? e.Country_of_Manufacture.toString()
                      : e.utility.toString()),
              DataGridCell<String>(
                  columnName: currentIndex == 0
                      ? 'Number_of_Cylinders'
                      : 'Collateral_Coverage_Ratio',
                  value: currentIndex == 0
                      ? e.Number_of_Cylinders.toString()
                      : e.Collateral_Coverage_Ratio.toString()),
              DataGridCell<String>(
                  columnName:
                      currentIndex == 0 ? 'Horsepower' : 'Building_Score',
                  value: currentIndex == 0
                      ? e.Horsepower.toString()
                      : e.Building_Score.toString()),
              DataGridCell<String>(
                  columnName: currentIndex == 0 ? 'carScore' : 'blueprintId',
                  value: currentIndex == 0
                      ? e.carScore.toString()
                      : e.blueprintId.toString())
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
        child: e.columnName == 'Detail'
            ? LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                return IconButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CollateralDetail(type:currentIndex,loanDetail: row.getCells()))),
                        },
                    icon: FaIcon(
                      FontAwesomeIcons.circleInfo,
                      color: ColorResources.accentColor,
                    ));
              })
        padding: EdgeInsets.all(3),
        child: e.columnName == 'Image'
            ? e.value == null
                ? Image.asset(
                    "assets/images/collaterals.png",
                    fit: BoxFit.scaleDown,
                  ):e.value == "building"?
                  Image.asset(
                    "assets/images/buildings.png",
                    fit: BoxFit.scaleDown,
                  )
                : Image.network(
                    e.value.toString(),
                    fit: BoxFit.scaleDown,
                  )
            : Text(e.value.toString()),
      );
    }).toList());
  }
}

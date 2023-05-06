import 'package:e_bidir/bloc/my_loan/my_loan_bloc.dart';
import 'package:e_bidir/data/api/api_client.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../bloc/banks/banks_bloc.dart';
import '../../data/model/my_loan/my_loan_info.dart';
import '../../repositories/bank_repo.dart';

/// The home page of the application which hosts the datagrid.

class MyLoansDataGrid extends StatelessWidget {
  // List<Employee> employees = <Employee>[];
   EmployeeDataSource employeeDataSource =
      EmployeeDataSource(myLoanData: []);
  // employees = getEmployeeData();
  // employeeDataSource = EmployeeDataSource(employeeData: employees);

  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: ColorResources.rejectedColor,
          statusBarIconBrightness: Brightness.dark,
        ),
     child: BlocProvider<MyLoanBloc>(
      create: (BuildContext context) =>
          MyLoanBloc(myLoanRepo: BankRepo(apiClient: ApiClient()))..add(GetMyLoans()),
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
          )
      )],
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
          body: BlocConsumer<MyLoanBloc, MyLoanState>(
            listener: (BuildContext context,state) {
              if(state.status.hasError){
                showSnackBar(context, state, _textTheme);
              }
            },
            builder: (BuildContext context, state) {
              state.status.isSuccess ? employeeDataSource = EmployeeDataSource(myLoanData: state.myLoanInfo) : null;
              return state.status.isLoading ? Center(child: CircularProgressIndicator()) :
              SfDataGrid(
                allowSorting: true,
                allowMultiColumnSorting: true,
                allowFiltering: true,
                // showCheckboxColumn: true,
                frozenColumnsCount: 1,
                
                selectionMode: SelectionMode.none,
                columnWidthMode: ColumnWidthMode.auto,
                source: employeeDataSource,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'Detail',
                        label: Container(
                            padding: EdgeInsets.all(1.0),
                            alignment: Alignment.center,
                            child: Text('Detail'))),
                  GridColumn(
                      columnName: 'Bank',
                      label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Bank',
                          ))),
                  GridColumn(
                      columnName: 'Types_of_Collateral',
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
                      columnName: 'Loan_Payment_Period',
                      label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text('Period(Month)'))),
                  GridColumn(
                      columnName: 'Monthly_payment',
                      label: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: Text('Monthly Payment'))),
                    GridColumn(
                        columnName: 'Interest',
                        label: Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Text('Interest'))),
                    GridColumn(
                        columnName: 'Type_Of_Loan',
                        label: Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Text('Type of Loan'))),
                    GridColumn(
                        columnName: 'Job_Status',
                        label: Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Text('Job Status'))),
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
              );
            },
          )),
    ));

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
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<MyLoanInfo> myLoanData}) {
    _employeeData = myLoanData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<Widget>(columnName: 'Detail', value: null),

      DataGridCell<String>(columnName: 'Bank', value: e.Bank),
              DataGridCell<String>(
                  columnName: 'Types_of_Collateral', value: e.Types_of_Collateral),
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(
                  columnName: 'loan_amount', value: e.loan_amount.toString()),
              DataGridCell<String>(
                  columnName: 'Loan_Payment_Period',
                  value: e.Loan_Payment_Period) ,
              DataGridCell<String>(
                  columnName: 'Monthly_payment',
                  value: e.Monthly_payment.toString()),
      DataGridCell<String>(
          columnName: 'Interest',
          value: e.interest.toString()),
      DataGridCell<String>(
          columnName: 'Type_Of_Loan',

          value: e.Type_Of_Loan),
      DataGridCell<String>(
          columnName: 'Job_Status',

          value: e.Job_Status),
              DataGridCell<String>(
                  columnName: 'score', value: e.score.toString()),
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
        padding: EdgeInsets.all(5.0),
        child:
        e.columnName == 'Detail'
            ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return IconButton(onPressed: ()=>{

              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LoanDetail( loanDetail: row.getCells()))),


              }, icon: FaIcon(
                FontAwesomeIcons.circleInfo,
                color: ColorResources.accentColor,
              ));
            })
            :
        Text(e.value.toString()),
      );
    }).toList());
  }
}

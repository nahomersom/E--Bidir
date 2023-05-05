import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_bidir/bloc/collateral_post/collateral_post_bloc.dart';
import 'package:e_bidir/bloc/economic/economic_bloc.dart';
import 'dart:io';
import 'package:e_bidir/bloc/person/personal_bloc.dart';
import 'package:e_bidir/data/country_list.dart';
import 'package:e_bidir/data/model/economic.dart';
import 'package:e_bidir/data/model/person.dart';
import 'package:e_bidir/data/model/request/building_request.dart';
import 'package:e_bidir/data/model/request/vehicle_request.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/create_loan/create_loan_bloc.dart';
import '../../bloc/user_profile/user_profile_bloc.dart';
import '../../data/model/loan.dart';
import '../../helpers/route_helper.dart';
import '../widgets/shared_button.dart';
import '../widgets/tab_button.dart';
import '../widgets/tab_text_field.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<String> criminalRecords = [
  'No',
  'YES/PAST FIVE YEARS',
  'YES/MORE THAN FIVE YEARS'
];
String bluePrintImage = '';
String carImage = '';

List<String> typeOfCollateral = ['Vehicle', 'Building', 'Vehicle,Building'];
List<String> jobStatus = ['Employed', 'Self Employed', 'UnEmployed'];

///////////////////////////////////////Building///////////////////

List<Map<dynamic, dynamic>> banks = [
  {'name': 'Abay Bank', 'interest': 0.08},
  {'name': "Addis Bank", 'interest': 0.06},
  {'name': "Ahadu Bank", 'interest': 0.069},
  {'name': "Amhara Bank", 'interest': 0.08},
  {'name': "Awash Bank", 'interest': 0.07},
  {'name': "Bank of Abyssinia", 'interest': 0.05},
  {'name': "Berhan Bank", 'interest': 0.08},
  {'name': "Bunna Bank", 'interest': 0.06},
  {'name': "Commercial Bank of Ethiopia", 'interest': 0.07},
  {'name': "Cooperative Bank of Oromia", 'interest': 0.06},
  {'name': "Dashen Bank", 'interest': 0.07},
  {'name': "Debub Global Bank", 'interest': 0.09},
  {'name': "Development Bank", 'interest': 0.04},
  {'name': "Enat Bank", 'interest': 0.088},
  {'name': "GohBetoch Bank", 'interest': 0.078},
  {'name': "Hibret Bank", 'interest': 0.085},
  {'name': "Hijra Bank", 'interest': 0.02},
  {'name': "Lion Bank", 'interest': 0.067},
  {'name': "National Bank", 'interest': 0.05},
  {'name': "Nib Bank", 'interest': 0.008},
  {'name': "Oromia Bank", 'interest': 0.067},
  {'name': "Shabelle Bank", 'interest': 0.078},
  {'name': "Siinqee Bank", 'interest': 0.05},
  {'name': "Tsehay Bank", 'interest': 0.068},
  {'name': "Tsedey Bank", 'interest': 0.059},
  {'name': "Wegagen Bank", 'interest': 0.01},
  {'name': "ZamZam Bank", 'interest': 0.07},
  {'name': "Zemen Bank", 'interest': 0.086},
];

List<String> marriageStatus = ['Married', 'Unmarried'];
List<String> educationStatus = [
  'PHD',
  'Doctrate',
  'Masters',
  'Degree',
  'Diploma',
  'TVET',
  'Certificate'
];
List<String> typeOfLoan = [
  'Personal Loan',
  'Student Loan',
  'Mortage',
  'Auto',
  'Payday',
  'Pawn Shop',
  'Small Business',
  'Credit Builder',
  'Debt Consolidation',
  'Holiday',
  'Home Improvement',
  'Medical',
  'Vacation',
  'Wedding',
  'Recreation Vehicle and Boat Loans',
  'Pool loan',
  'Famil Loan'
];
List<String> Location = [
  '22(HAYAHULET)',
  '4 kilo',
  '6 kilo',
  'Addisu Gebeya',
  'Asko',
  'Au',
  'Aware',
  'Ayate Babure Tabya',
  'Ayate Beshale',
  'Ayate',
  'Baledras',
  'Balere Meda',
  'Balere',
  'Bole Arabsa',
  'Bole Atlas',
  'Bole Homes'
];
List<String> purposeOfBuilding = [
  'Residential',
  'Commercial',
  'Mixed',
];

Map<String, dynamic> utilities = {
  "water": false,
  "internet": false,
  "gas": false,
  "electricity": false
};
Map<String, dynamic> constructionStatus = {
  "Sub_Structure": false,
  "Super_Structure": false,
  "Partially": false,
  "Fully": false,
  "Electro_Mechanical_Lifts": false
};

List<String> typeOfBuildings = [
  'G+0',
  'G+1',
  'G+2',
  'G+3',
  'G+4',
  'G+5',
];
List<String> constructionYear = [
  '2023',
  '2022',
  '2021',
  '2020',
  '2019',
  '2018',
  '2017',
  '2016',
  '2015',
  '2014',
  '2013',
  '2012',
  '2011',
  '2010',
  '2009',
  '2008',
  '2007',
  '2006',
  '2005',
  '2004',
  '2003',
  '2002',
  '2001',
  '2000',
  '1999',
  '1998',
  '1997',
  '1996',
  '1995',
  '1994',
  '1993',
  '1992',
  '1991',
  '1990'
];
////////////////////////////////////////vehicle///////////////////
List<String> typeOfVehicle = [
  'Sedan',
  'Micro',
  'SUV',
  'Pickup',
  'van',
  'Mini Truck',
  'Big Truck',
  'Bus'
];
List<String> brandOfVehicle = ['BYD', 'Toyota', 'Isuzu'];
List<String> bydModel = ['BYD lift back FO', 'BYD F3 GLI (full option)'];
List<String> toyotaModel = ['toyota tt50', 'toyota 1211'];
List<String> isuzuModel = ['isuzu isu0', 'isuzu isu1'];
List<String> cylinder = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  '9',
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
];
List<String> transmission = [
  "Manual Transmission",
  "Automatic Transmission",
];
List<String> vehicleModelYear = [
  '2018',
  '2017',
  '2016',
  '2015',
  '2014',
  '2013',
  '2012',
  '2011',
  '2010',
  '2009',
  '2008',
  '2007',
  '2006',
  '2005',
  '2004',
  '2003',
  '2002',
  '2001'
];

class LoanRequest extends StatefulWidget {
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  _LoanRequestState() {

    modelValue = brandOfVehicleValue == 'BYD'
        ? bydModel.first
        : brandOfVehicleValue == 'Toyota'
            ? toyotaModel.first
            : isuzuModel.first;
  }
  String? modelValue;
  List<String> tabText = ['Personal', 'Loan', 'Economic', 'Collateral'];
  bool isFormSubmitted = false;
  bool isLoanFormSubmitted = false;
  bool isBuildingFormSubmitted = false;
  bool isVehicleFormSubmitted = false;
  bool isEconomicFormSubmitted = false;
  final _personalFormKey = GlobalKey<FormState>();
  final _loanFormKey = GlobalKey<FormState>();
  final _economicFormKey = GlobalKey<FormState>();
  final _collateralFormKey = GlobalKey<FormState>();
  Person? person;
  Loan? loan;
  BuildingBody? buildingBody;
  VehicleBody? vehicleBody;
  Economic? economic;
  TextEditingController _ageControl = TextEditingController();
  TextEditingController _educationStatusControl = TextEditingController();
  TextEditingController _marriageStatusControl = TextEditingController();
  String criminalRecordValue = criminalRecords.first;
  String martialStatusValue = marriageStatus.first;
  String educationStatusValue = educationStatus.first;
  String banksValue = banks.first['name'] ?? '';

  String typeOfLoanValue = typeOfLoan.first;
  String jobStatusValue = jobStatus.first;
  String typeOfCollateralValue = typeOfCollateral.first;
  TextEditingController _numberOfDependentsControl = TextEditingController();
  /////////loan//////////////////////////////////////////
  // final TextEditingController Bank = TextEditingController();
  // final TextEditingController Job_Status = TextEditingController();
  final TextEditingController Loan_Payment_Period = TextEditingController();
  final TextEditingController Monthly_payment = TextEditingController();
  final TextEditingController Reason_for_loan = TextEditingController();
  // final TextEditingController Type_Of_Loan = TextEditingController();
  // final TextEditingController Types_of_Collateral = TextEditingController();
  final TextEditingController interest = TextEditingController();
  final TextEditingController loan_amount = TextEditingController();

  final TextEditingController Experience_control = TextEditingController();
  final TextEditingController Number_Of_Loans_control = TextEditingController();
  final TextEditingController Source_of_income_control =
      TextEditingController();
  final TextEditingController Total_Monthly_Income_control =
      TextEditingController();
  final TextEditingController field_of_employment_control =
      TextEditingController();
  final TextEditingController fully_repaid_loans_control =
      TextEditingController();
  //###############################BUILDING####################################//

  String locationValue = Location.first;
  String constructionYearValue = constructionYear.first;
  String typeOfBuildingValue = typeOfBuildings.first;
  String purposeOfBuildingValue = purposeOfBuilding.first;
  var constructionStatusValue;
  final TextEditingController Total_Area = TextEditingController();
  final TextEditingController Distance_from_Main_Road = TextEditingController();
  final TextEditingController blueprintId = TextEditingController();
///////////////////////////////Vehicle////////////////////////////////

  String typeOfVehicleValue = typeOfVehicle.first;
  String brandOfVehicleValue = brandOfVehicle.first;

  String cylinderValue = cylinder.first;
  String transmissionValue = transmission.first;

  String modelYear = vehicleModelYear.first;
  String vehicleCountry = countryList.elementAt(70);
  final TextEditingController Plate_Number = TextEditingController();
  final TextEditingController Horsepower = TextEditingController();
  final TextEditingController Transportation_Capacity = TextEditingController();
  final TextEditingController Mileage = TextEditingController();
  bool isConstructionValid = false;
  bool isUtilityValid = false;

  int currentIndex = 0;
  bool isSending = false;
  void dispose() {
    _ageControl.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;
    final _personBloc = BlocProvider.of<PersonBloc>(context);
    final _createBloc = BlocProvider.of<CreateLoanBloc>(context);
    final _collateralBloc = BlocProvider.of<CollateralBloc>(context);
    final _economicBloc = BlocProvider.of<EconomicBloc>(context);
    _onUpdatePersonButtonPressed(person, state) {
      setState(() {
        isFormSubmitted = true;
      });

      if ((_ageControl.text.isNotEmpty && _ageControl.value != '') &&
          (_educationStatusControl.text.isNotEmpty &&
              _educationStatusControl.value != '') &&
          (_marriageStatusControl.text.isNotEmpty &&
              _marriageStatusControl.value != '') &&
          (_numberOfDependentsControl.text.isNotEmpty &&
              _numberOfDependentsControl.value != '')) {
        person = Person(
            age: int.parse(_ageControl.text),
            Education_Status: educationStatusValue,
            Marriage_Status: martialStatusValue,
            Number_of_Dependents: int.parse(_numberOfDependentsControl.text),
            Criminal_Record: criminalRecordValue,
            PersonalScore: state.personalInfo?.PersonalScore ?? 0);
        _personBloc.add(UpdatePersonalProfile(person!));
      }
    }

    _onLoanButtonPressed(loan, state) {
      setState(() {
        isLoanFormSubmitted = true;
      });
      if ((Loan_Payment_Period.text.isNotEmpty &&
              Loan_Payment_Period.value != '') &&
          (Monthly_payment.text.isNotEmpty && Monthly_payment.value != '') &&
          (Reason_for_loan.text.isNotEmpty && Reason_for_loan.value != '') &&
          (interest.text.isNotEmpty && interest.value != '') &&
          (loan_amount.text.isNotEmpty && loan_amount.value != '')) {
        loan = Loan(
            Type_Of_Loan: typeOfLoanValue,
            Types_of_Collateral: typeOfCollateralValue,
            Monthly_payment: int.parse(Monthly_payment.text),
            interest: double.parse(interest.text.replaceAll(',','')),
            loan_amount: double.parse(loan_amount.text.replaceAll(',', '')),
            Reason_for_loan: Reason_for_loan.text,
            Loan_Payment_Period: Loan_Payment_Period.text,
            Job_Status: jobStatusValue,
            Bank: banksValue);

        _createBloc.add(OnCreateLoan(loan!));
      }
    }

    _onBuildingPressed(loan, state) {
      setState(() {
        isBuildingFormSubmitted = true;
      });
      constructionStatus.forEach((key, value) {
        if (value == true) {

          setState(() {
            isConstructionValid = true;
          });
        }
      });
      utilities.forEach((key, value) {
        if (value == true) {
          setState(() {
            isUtilityValid = true;
          });
        }
      });
      if ((Total_Area.text.isNotEmpty && Total_Area.value != '') &&
          (Distance_from_Main_Road.text.isNotEmpty &&
              Distance_from_Main_Road.value != '') &&
          (blueprintId.text.isNotEmpty && blueprintId.value != '') &&
          (bluePrintImage != '') &&
          isUtilityValid &&
          isConstructionValid) {
        // Map<String, bool> constrouctionPayload =
        //     constructionStatus.cast<String, bool>();
        // Map<String, bool> utilityPayload = utilities.cast<String, bool>();
        //
        // constrouctionPayload.forEach((key, value) {
        //   if (value == true) {
        //     constrouctionPayload[key] = true;
        //   } else {
        //     constrouctionPayload[key] = true;
        //   }
        // });
        // utilityPayload.forEach((key, value) {
        //   if (value == true) {
        //     utilityPayload[key] = false;
        //   } else {
        //     utilityPayload[key] = false;
        //   }
        // });

        buildingBody = BuildingBody(
            Purpose_of_the_Building: purposeOfBuildingValue,
            Location: locationValue,
            Year_of_Construction: int.parse(constructionYearValue),
            Total_Area: Total_Area.text,
            Distance_from_Main_Road: Distance_from_Main_Road.text,
            Type_of_Building: typeOfBuildingValue,
            Construction_Status: constructionStatus,
            utility: utilities,
            blueprintId: blueprintId.text,
            blueprint: [bluePrintImage],
            type: {'type': "1"});

        _collateralBloc.add(PostBuilding(buildingBody!));
      }
    }

    _onVehiclePressed(loan, state) {
      setState(() {
        isVehicleFormSubmitted = true;
      });

      if ((Plate_Number.text.isNotEmpty && Plate_Number.value != '') &&
          (Horsepower.text.isNotEmpty && Horsepower.value != '') &&
          (Mileage.text.isNotEmpty && Mileage.value != '') &&
          (Transportation_Capacity.text.isNotEmpty &&
              Transportation_Capacity.value != '') &&
          (carImage != '')) {
        vehicleBody = VehicleBody(
            Number_of_Cylinders: cylinderValue,
            Brand_of_Vehicle: brandOfVehicleValue,
            Country_of_Manufacture: vehicleCountry,
            Model_of_Vehicle: modelValue,
            Transmission: transmissionValue,
            Type_of_Vehicle: typeOfVehicleValue,
            Mileage: int.parse(Mileage.text),
            Plate_Number: Plate_Number.text,
            Horsepower: Horsepower.text,
            Year_of_Manufacture: int.parse(modelYear),
            Transportation_Capacity: Transportation_Capacity.text,
            carImage: [carImage],
            type: {'type': "1"});

        _collateralBloc.add(PostVehicle(vehicleBody!));
      }
    }

    _onEconomicButtonPressed(economy, state) {
      setState(() {
        isLoanFormSubmitted = true;
      });
      if ((Experience_control.text.isNotEmpty &&
              Experience_control.value != '') &&
          (Number_Of_Loans_control.text.isNotEmpty &&
              Number_Of_Loans_control.value != '') &&
          (Source_of_income_control.text.isNotEmpty &&
              Source_of_income_control.value != '') &&
          (Total_Monthly_Income_control.text.isNotEmpty &&
              Total_Monthly_Income_control.value != '') &&
          (fully_repaid_loans_control.text.isNotEmpty &&
              fully_repaid_loans_control.value != '') &&
          (field_of_employment_control.text.isNotEmpty &&
              field_of_employment_control.value != '')) {
        economic = new Economic(
            fully_repaid_loans: fully_repaid_loans_control.text,
            field_of_employment: field_of_employment_control.text,
            Source_of_income: Source_of_income_control.text,
            Experience: Experience_control.text,
            Number_Of_Loans: Number_Of_Loans_control.text,
            Total_Monthly_Income: Total_Monthly_Income_control.text);

        _economicBloc.add(OnUpdateEconomy(economic!));
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        key: _scaffoldKey,
        body: BlocConsumer<UserProfileBloc, UserProfileState>(
            listener: (context, profileState) {
          _ageControl.text = profileState.personalInfo?.age.toString() ?? '';
          _educationStatusControl.text =
              profileState.personalInfo?.Education_Status ?? '';
          _marriageStatusControl.text =
              profileState.personalInfo?.Marriage_Status ?? '';
          _numberOfDependentsControl.text =
              profileState.personalInfo?.Number_of_Dependents.toString() ?? '';

          Experience_control.text =
              profileState.economicInfo?.Experience.toString() ?? '';
          Number_Of_Loans_control.text =
              profileState.economicInfo?.Number_Of_Loans.toString() ?? '';
          Source_of_income_control.text =
              profileState.economicInfo?.Source_of_income.toString() ?? '';
          Total_Monthly_Income_control.text =
              profileState.economicInfo?.Total_Monthly_Income.toString() ?? '';

          field_of_employment_control.text =
              profileState.economicInfo?.field_of_employment.toString() ?? '';
          fully_repaid_loans_control.text =
              profileState.economicInfo?.fully_repaid_loans.toString() ?? '';

          if (profileState.userProfileStatus.hasUserProfileError) {
            showSnackBar(context, profileState, _textTheme);
          }
        }, builder: (context, state) {
          if (state.userProfileStatus.isUserProfileLoading) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text('Loading your Personal Data')
              ],
            ));
          }
          if (state.userProfileStatus.isUserProfileSuccess) {

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * 0.08,
                    vertical: SizeConfig.screenHeight! * 0.03),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          onPressed: () => {

                            Navigator.pushReplacementNamed(
                              context, RouteHelper.home)},
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            weight: 30,
                            size: 40,
                          ),
                          color: ColorResources.accentColor,
                        )),
                    Text(
                      'Loan Request',
                      textAlign: TextAlign.center,
                      style: _textTheme.headlineSmall?.copyWith(
                          color: ColorResources.accentColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: SizeConfig.screenHeight! * 0.14,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabText.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  height: SizeConfig.screenHeight! * 0.06,
                                  width: SizeConfig.screenHeight! * 0.06,
                                  margin: EdgeInsets.only(
                                      left: 15, right: 20, top: 10, bottom: 5),
                                  decoration: currentIndex == index
                                      ? BoxDecoration(
                                          color: ColorResources.accentColor,
                                          border: Border.all(
                                              color: ColorResources.accentColor,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(100))
                                      : BoxDecoration(
                                          border: Border.all(
                                              color: ColorResources.accentColor,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                  child: Center(
                                      child: Text(
                                    (index + 1).toString(),
                                    style: _textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: currentIndex == index
                                            ? ColorResources.scaffoldColor
                                            : ColorResources.accentColor),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ),
                              Text(
                                tabText[index],
                                style: _textTheme.labelMedium?.copyWith(
                                    color: currentIndex == index
                                        ? ColorResources.accentColor
                                        : ColorResources.lightStatusTextColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Form(
                            key: currentIndex == 0
                                ? _personalFormKey
                                : currentIndex == 1
                                ? _loanFormKey
                                : currentIndex == 2
                                ? _economicFormKey
                                : _collateralFormKey,
                            child: Column(
                              children: getTabItem(
                                  _textTheme, state.personalInfo)[currentIndex],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.03,
                          ),
                          currentIndex == 1
                              ? BlocConsumer<CreateLoanBloc, CreateLoanState>(
                            listener: (context, state) {
                              if (state.newLoanInfoStatus.hasLoanRequestError) {

                                setState(() {
                                  isLoanFormSubmitted = false;
                                });
                                showSnackBar(context, state, _textTheme);
                              }
                            },
                            builder: (context, state) {
                              if (state
                                  .newLoanInfoStatus.isLoanRequestSuccess) {
                                WidgetsBinding.instance.addPostFrameCallback(
                                      (_) => {
                                    // your onPressed logic
                                    currentIndex = 2
                                    // AwesomeDialog(
                                    //   dismissOnTouchOutside: false,
                                    //   btnOkColor: ColorResources.accentColor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType: DialogType.success,
                                    //   title: 'Success',
                                    //   desc: 'Loan Created Successfully',
                                    //   btnOkOnPress: () {
                                    //     setState(() {
                                    //       currentIndex = 2;
                                    //     });
                                    //   },
                                    // )..show()
                                  },
                                );
                              }

                              return TabButton(
                                tabButtonText: 'Create Loan',
                                isSending:
                                state.newLoanInfoStatus.isLoanRequestLoading
                                    ? true
                                    : false,
                                onPressed: () => {
                                  // setState(() => {currentIndex++})
                                  _onLoanButtonPressed(loan, state)
                                },
                              );
                            },
                          )
                              : currentIndex == 2
                              ? BlocConsumer<EconomicBloc, UpdateEconomyState>(
                            listener: (context, state) {
                              if (state.updateEconomicInfoStatus
                                  .hasLoanRequestError) {

                                setState(() {
                                  isLoanFormSubmitted = false;
                                });
                                showSnackBar(context, state, _textTheme);
                              }
                            },
                            builder: (context, state) {
                              if (state.updateEconomicInfoStatus
                                  .isLoanRequestSuccess) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback(
                                      (_) => {
                                    // your onPressed logic
                                    setState(() => {
                                      typeOfCollateralValue ==
                                          "Building"
                                          ? currentIndex = 3
                                          : currentIndex = 4
                                    })
                                    // AwesomeDialog(
                                    //   useRootNavigator: true,
                                    //   dismissOnTouchOutside: false,
                                    //   btnOkColor:
                                    //       ColorResources.accentColor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType: DialogType.success,
                                    //   title: 'Success',
                                    //   desc:
                                    //       'Economic Info Updated Successfully',
                                    //   btnOkOnPress: () {
                                    //     setState(() => {
                                    //           typeOfCollateralValue ==
                                    //                   "Building"
                                    //               ? currentIndex = 3
                                    //               : currentIndex = 4
                                    //         });
                                    //   },
                                    // )..show()
                                  },
                                );
                              }

                              return TabButton(
                                tabButtonText: 'Next',
                                isSending: state.updateEconomicInfoStatus
                                    .isLoanRequestLoading
                                    ? true
                                    : false,
                                onPressed: () =>
                                {_onEconomicButtonPressed(loan, state)},
                              );
                            },
                          )
                              : currentIndex == 3 &&
                              typeOfCollateralValue == "Building"
                              ? BlocConsumer<CollateralBloc,
                              CollateralPostState>(
                            listener: (context, state) {
                              if (state
                                  .buildingsStatus.hasBuildingError) {

                                setState(() {
                                  isBuildingFormSubmitted = false;
                                });
                                showSnackBar(context, state, _textTheme,
                                    isCollateral: true);
                              }
                            },
                            builder: (context, state) {
                              if (state
                                  .buildingsStatus.isBuildingSuccess) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback(
                                      (_) => {
                                    // your onPressed logic
                                    setState(() {
                                      if (typeOfCollateralValue ==
                                          "Vehicle,Building") {
                                        setState(
                                                () => {currentIndex = 4});
                                      } else {
                                        Navigator.pushReplacementNamed(
                                            context, RouteHelper.home);
                                      }
                                    })

                                    // AwesomeDialog(
                                    //   useRootNavigator: true,
                                    //   dismissOnTouchOutside: false,
                                    //   btnOkColor:
                                    //       ColorResources.accentColor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType: DialogType.success,
                                    //   title: 'Success',
                                    //   desc: 'Building Collateral Added',
                                    //   btnOkOnPress: () {
                                    //     setState(() {
                                    //       if (typeOfCollateralValue ==
                                    //           "Vehicle,Building") {
                                    //         setState(() =>
                                    //             {currentIndex = 4});
                                    //       } else {
                                    //         Navigator
                                    //             .pushReplacementNamed(
                                    //                 context,
                                    //                 RouteHelper.home);
                                    //       }
                                    //     });
                                    //   },
                                    // )..show()
                                  },
                                );
                              }

                              return TabButton(
                                tabButtonText: 'Add Building',
                                isSending: state.buildingsStatus
                                    .isBuildingLoading
                                    ? true
                                    : false,
                                onPressed: () => {
                                  // setState(() => {currentIndex++})
                                  _onBuildingPressed(loan, state)
                                },
                              );
                            },
                          )
                              : currentIndex == 4 &&
                              typeOfCollateralValue == "Vehicle"
                              ? BlocConsumer<CollateralBloc,
                              CollateralPostState>(
                            listener: (context, state) {
                              if (state
                                  .vehicleStatus.hasVehicleError) {
                                setState(() {
                                  isVehicleFormSubmitted = false;
                                });
                                showSnackBar(
                                    context, state, _textTheme,
                                    isCollateral: true);
                              }
                            },
                            builder: (context, state) {
                              if (state
                                  .vehicleStatus.isVheicleSuccess) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback(
                                      (_) => {
                                    // your onPressed logic
                                    Navigator.pushReplacementNamed(
                                        context, RouteHelper.home)
                                    // AwesomeDialog(
                                    //   useRootNavigator: true,
                                    //   dismissOnTouchOutside: false,
                                    //   btnOkColor: ColorResources
                                    //       .accentColor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType:
                                    //       DialogType.success,
                                    //   title: 'Success',
                                    //   desc:
                                    //       'Collateral Vehicle Added',
                                    //   btnOkOnPress: () {
                                    //     Navigator
                                    //         .pushReplacementNamed(
                                    //             context,
                                    //             RouteHelper.home);
                                    //   },
                                    // )..show()
                                  },
                                );
                              }

                              return TabButton(
                                tabButtonText: 'Add Vehicle',
                                isSending: state.vehicleStatus
                                    .isVheicleLoading
                                    ? true
                                    : false,
                                onPressed: () => {
                                  // setState(() => {currentIndex++})
                                  _onVehiclePressed(loan, state)
                                },
                              );
                            },
                          )
                              : BlocConsumer<PersonBloc, PersonalState>(
                            listener: (context, state) {
                              if (state.personalStatus
                                  .hasPersonalProfileError) {
                                showSnackBar(
                                    context, state, _textTheme);
                                setState(() {
                                  isFormSubmitted = false;
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state.personalStatus
                                  .isPersonalProfileSuccess) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback(
                                      (_) => {
                                    // your onPressed logic
                                    setState(() {
                                      currentIndex++;
                                    }),
                                    // AwesomeDialog(
                                    //   useRootNavigator: true,
                                    //   dismissOnTouchOutside: false,
                                    //   btnOkColor: ColorResources
                                    //       .accentColor,
                                    //   context: context,
                                    //   animType: AnimType.scale,
                                    //   dialogType:
                                    //       DialogType.success,
                                    //   title: 'Success',
                                    //   desc:
                                    //       'Personal Info Updated Successfully',
                                    //   btnOkOnPress: () {
                                    //     setState(() {
                                    //       currentIndex++;
                                    //     });
                                    //   },
                                    // )..show()
                                  },
                                );
                              }

                              return TabButton(
                                isSending: state.personalStatus
                                    .isPersonalProfileLoading
                                    ? true
                                    : false,
                                onPressed: () => {
                                  _onUpdatePersonButtonPressed(
                                      person, state)
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.01,
                          ),
                        ],
                      ),

                    ),

                  ],
                ),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }

  List<List<Widget>> getTabItem(_textTheme, value) {

    // _ageControl.value.copyWith(text:value.age.toString());
    // _ageControl.text = value.age.toString();
    // print(value.Criminal_Record);
    List<List<Widget>> myW = [
      [
        SizedBox(
          height: 5,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Age',
          isFormSubmitted: isFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          formKey: value?.age,
          textEditingController: _ageControl,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Education Status',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: educationStatusValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),

              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  educationStatusValue = value!;
                });
              },
              items:
                  educationStatus.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Marriage Status',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: martialStatusValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),

              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  martialStatusValue = value!;
                });
              },
              items:
                  marriageStatus.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Criminal Records',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: criminalRecordValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  criminalRecordValue = value!;
                });
              },
              items:
                  criminalRecords.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textTheme: _textTheme,
            label: ' Number of Dependents',
            isFormSubmitted: isFormSubmitted,
            textEditingController: _numberOfDependentsControl,
            isReadonly: false,
            isNumberField: true,
            value: value?.Number_of_Dependents),
      ],
      [
        SizedBox(
          height: 15,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Loan Amount',
          isFormSubmitted: isLoanFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          isMoneyField: true,
          textEditingController: loan_amount,
          onChange: (value) => {

            setState(() => {
              Loan_Payment_Period.text.isNotEmpty && interest.text.isNotEmpty
                  ? Monthly_payment.text = getMonthlyPayment().toString()
                  : null
            })
          },
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          isFormSubmitted: isLoanFormSubmitted,
          textTheme: _textTheme,
          isReadonly: false,
          label: 'Reason For Loan',
          textEditingController: Reason_for_loan,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          isFormSubmitted: isLoanFormSubmitted,
          label: 'Loan Payment Period',
          onChange: (value) => {

            loan_amount.text.isNotEmpty && interest.text.isNotEmpty
                ? Monthly_payment.text = getMonthlyPayment().toString()
                : null
          },
          isReadonly: false,
          isNumberField: true,
          textEditingController: Loan_Payment_Period,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Job Status',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: jobStatusValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  jobStatusValue = value!;
                });
              },
              items: jobStatus.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Banks',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: banksValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  banksValue = value!;
                 interest.text = getInterest(value);
                  loan_amount.text.isNotEmpty && Loan_Payment_Period.text.isNotEmpty
                      ? Monthly_payment.text = getMonthlyPayment().toString()
                      : null;
                });
              },
              items: banks.map<DropdownMenuItem<String>>((Map value) {
                return DropdownMenuItem<String>(
                  value: value['name'],
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(value['name'])),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Type Of Loan',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: typeOfLoanValue,
              iconSize: 25.0,
              isExpanded: true,
              underline: SizedBox(),
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  typeOfLoanValue = value!;
                });
              },
              items: typeOfLoan.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Type Of Collateral',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,

              value: typeOfCollateralValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  typeOfCollateralValue = value!;
                });
              },
              items: typeOfCollateral
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Monthly Payment',
          isFormSubmitted: isLoanFormSubmitted,
          isReadonly: true,
          isNumberField: true,
          textEditingController: Monthly_payment,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Interest',
          isNumberField: true,
          isFormSubmitted: isLoanFormSubmitted,
          isReadonly: true,
          textEditingController: interest,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
      ],
      [
        SizedBox(
          height: 15,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Field Of Employment',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: field_of_employment_control,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Source Of Income',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: Source_of_income_control,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Experience',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: Experience_control,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Number Of Loans',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: Number_Of_Loans_control,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Fully Repaid Loans',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: fully_repaid_loans_control,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Total Monthly Income',
          isFormSubmitted: isEconomicFormSubmitted,
          isReadonly: false,
          textEditingController: Total_Monthly_Income_control,
        ),
      ],
      [
        SizedBox(
          height: 15,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Location',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: locationValue,
              iconSize: 25.0,
              isExpanded: true,
              underline: SizedBox(),
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  locationValue = value!;
                });
              },
              items: Location.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Construction Year',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: constructionYearValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  constructionYearValue = value!;
                });
              },
              items: constructionYear
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Total Area',
          isFormSubmitted: isBuildingFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: Total_Area,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Distance from the main road',
          isFormSubmitted: isBuildingFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: Distance_from_Main_Road,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Type Of Building',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: typeOfBuildingValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  typeOfBuildingValue = value!;
                });
              },
              items:
                  typeOfBuildings.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Blueprint Number',
          isFormSubmitted: isBuildingFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: blueprintId,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Purpose Of Building',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: purposeOfBuildingValue,
              iconSize: 25.0,
              isExpanded: true,
              underline: SizedBox(),
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  purposeOfBuildingValue = value!;
                });
              },
              items: purposeOfBuilding
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Upload Blue Print',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          isBuildingFormSubmitted && bluePrintImage == ''
              ? Text(
                  '*required*',
                  style: TextStyle(color: Colors.redAccent),
                )
              : SizedBox(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          MaterialButton(
            elevation: 0,
            color: ColorResources.textFieldColor,
            onPressed: () {
              setState(()=>{
              pickImage(),
              });

            },
            child: Text(
                bluePrintImage == ''
                    ? "Pick Image from Gallery"
                    : 'Change Image',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Construction Status',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          //       bool isConstructionValid = false;
          // bool isUtilityValid = false;
          isBuildingFormSubmitted && !isConstructionValid
              ? Text(
                  '*required*',
                  style: TextStyle(color: Colors.redAccent),
                )
              : SizedBox(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: constructionStatus.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key.replaceAll('_', ' ')),
                value: constructionStatus[key],
                activeColor: ColorResources.accentColor,
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      isConstructionValid = true;
                    }
                    constructionStatus[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Utilities',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          isBuildingFormSubmitted && !isUtilityValid
              ? Text(
                  '*required*',
                  style: TextStyle(color: Colors.redAccent),
                )
              : SizedBox(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: utilities.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key.replaceAll('_', ' ')),
                value: utilities[key],
                activeColor: ColorResources.accentColor,
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      isUtilityValid = true;
                    }
                    utilities[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ]),
      ],
      [
        SizedBox(
          height: 15,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Type Of Vehicle',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: typeOfVehicleValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),

              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  typeOfVehicleValue = value!;
                });
              },
              items:
                  typeOfVehicle.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Brand',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              value: brandOfVehicleValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  brandOfVehicleValue = value!;
                  modelValue = brandOfVehicleValue == 'BYD'
                      ? bydModel.first
                      : brandOfVehicleValue == 'Toyota'
                          ? toyotaModel.first
                          : isuzuModel.first;
                });
              },
              items:
                  brandOfVehicle.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Model',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
                // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
                value: modelValue,
                iconSize: 25.0,
                isExpanded: true,
                elevation: 16,
                underline: SizedBox(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    // brandOfVehicleValue = value!;
                    modelValue = value!;
                  });
                },
                items: brandOfVehicleValue == 'BYD'
                    ? bydModel.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(value)),
                        );
                      }).toList()
                    : brandOfVehicleValue == "Toyota"
                        ? toyotaModel
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(value)),
                            );
                          }).toList()
                        : isuzuModel
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(value)),
                            );
                          }).toList()),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Model Year',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,

              underline: SizedBox(),
              value: modelYear,
              hint: Text('Select a Year'),
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  modelYear = value!;
                });
              },
              items: vehicleModelYear
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Country',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,

              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              value: vehicleCountry,
              underline: SizedBox(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  vehicleCountry = value!;
                });
              },
              items: countryList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.02,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Cyilnder',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,
              underline: SizedBox(),
              iconSize: 25.0,
              value: cylinderValue,
              isExpanded: true,
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  cylinderValue = value!;
                });
              },
              items: cylinder.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.02,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Transmission',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Container(
            color: ColorResources.textFieldColor,
            child: DropdownButton<String>(
              // value: value.Criminal_Record != null ? value.Criminal_Record : criminalRecordValue,

              underline: SizedBox(),
              value: transmissionValue,
              iconSize: 25.0,
              isExpanded: true,
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  transmissionValue = value!;
                });
              },
              items: transmission.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12), child: Text(value)),
                );
              }).toList(),
            ),
          ),
        ]),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Plate Number',
          isFormSubmitted: isVehicleFormSubmitted,
          isReadonly: false,
          textEditingController: Plate_Number,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Horse Power',
          isFormSubmitted: isVehicleFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: Horsepower,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Transportation Capacity',
          isFormSubmitted: isVehicleFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: Transportation_Capacity,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
          textTheme: _textTheme,
          label: 'Mileage(KM)',
          isFormSubmitted: isVehicleFormSubmitted,
          isReadonly: false,
          isNumberField: true,
          textEditingController: Mileage,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Vehicle Image',
              style: _textTheme.labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          isVehicleFormSubmitted && carImage == ''
              ? Text(
                  '*required*',
                  style: TextStyle(color: Colors.redAccent),
                )
              : SizedBox(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          MaterialButton(
            elevation: 0,
            color: ColorResources.textFieldColor,
            onPressed: () {
              setState(()=>{
              pickImage(type: 'vehicle'),
              });

            },
            child: Text(carImage == '' ? "Pick Image from Gallery" : "change Image",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
        ]),
      ],
    ];
    return myW;
  }

  getMonthlyPayment() {

    var bankInterest = double.parse(interest.text);
    var loanPaymentPeriod = Loan_Payment_Period.text;
    var loanInterest = double.parse(loan_amount.text.replaceAll(',', '')) *
        ((bankInterest / 12) *
            pow(((bankInterest / 12) + 1), int.parse(loanPaymentPeriod))) /
        (pow(((bankInterest / 12) + 1), int.parse(loanPaymentPeriod)) - 1);
    return loanInterest.toString();
  }

  Future pickImage({type = 'building'}) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path).readAsBytesSync();
      type == 'vehicle'
          ? carImage = "data:image/png;base64," + base64Encode(imageTemp)
          : bluePrintImage = "data:image/png;base64," + base64Encode(imageTemp);

    } on PlatformException catch (e) {

    }
  }
  String getInterest(bankName){
    var bankInterest;
    banks.forEach((e) => {
     bankName == e['name'] ? bankInterest = e['interest'] : '0',
    });
    return bankInterest.toString();
  }
  void showSnackBar(context, state, _textTheme, {isCollateral = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: ColorResources.errorText,
        content: Center(
            child: Text(
                isCollateral
                    ? state.vehicleErrorMessage + state.buildingErrorMessage
                    : state.errorMessage,
                style: _textTheme.titleSmall?.copyWith(color: Colors.white)))));
  }
}

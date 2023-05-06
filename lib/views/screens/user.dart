import 'package:e_bidir/bloc/user_profile/user_profile_bloc.dart';
import 'package:e_bidir/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_client.dart';
import '../../helpers/route_helper.dart';
import '../../utils/color_resource.dart';
import '../../utils/size_config.dart';
import '../widgets/shared_button.dart';
import '../widgets/tab_button.dart';
import '../widgets/tab_text_field.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    super.initState();
  }

  List<String> tabText = ['User Info', 'Additional', 'Account'];
  int currentIndex = 0;
  bool isSending = false;
  TextEditingController _nameControl = TextEditingController();
  TextEditingController _genderControl = TextEditingController();
  TextEditingController _ageControl = TextEditingController();
  TextEditingController _phoneControl = TextEditingController();
  TextEditingController _educationStatusControl = TextEditingController();
  TextEditingController _marriageStatusControl = TextEditingController();

  TextEditingController _fieldOfEmployementControl = TextEditingController();
  TextEditingController _totalMonthlyIncomeControl = TextEditingController();
  TextEditingController _sourceOfIncomeControl = TextEditingController();
  TextEditingController _experienceControl = TextEditingController();
  TextEditingController _tinNumberControl = TextEditingController();
  TextEditingController _numberOfDependentsControl = TextEditingController();
  TextEditingController _fullyRepaidLoanControl = TextEditingController();
  TextEditingController _emailControl = TextEditingController();
  TextEditingController _scoreControl = TextEditingController();
  TextEditingController _createdATControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listener: (context, state) {
            print('state');



        if (state.userProfileStatus.hasUserProfileError) {
          showSnackBar(context, state, _textTheme);
        }
      }, builder: (context, state) {
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
                      onPressed: () =>
                          Navigator.pushNamed(context, RouteHelper.home),
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        weight: 30,
                        size: 40,
                      ),
                      color: ColorResources.accentColor,
                    )),
                Text(
                  'User Profile',
                  textAlign: TextAlign.center,
                  style: _textTheme.headlineSmall?.copyWith(
                      color: ColorResources.accentColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: SizeConfig.screenHeight! * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabText.length,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 10,
                            right: SizeConfig.screenWidth! * 0.1,
                            top: 10,
                            bottom: 5),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                setState(() => {currentIndex = index})
                              },
                              child: Container(
                                height: SizeConfig.screenHeight! * 0.06,
                                width: SizeConfig.screenHeight! * 0.06,
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
                            SizedBox(height: 3,),
                            Text(
                              tabText[index],
                              style: _textTheme.labelMedium?.copyWith(
                                  color: currentIndex == index
                                      ? ColorResources.accentColor
                                      : ColorResources.lightStatusTextColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                currentIndex == 0
                    ? Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      NetworkImage(state.userInfo?.profile['url'] ?? ''),
                    ))
                    : SizedBox(),
               Expanded(
                 child: ListView(
                   children: [

                     Column(
                         children: getTabItems(_textTheme, state.userInfo,
                             state.personalInfo, state.economicInfo)[currentIndex]),
                     SizedBox(
                       height: SizeConfig.screenHeight! * 0.03,
                     ),
                     currentIndex == 2
                         ? SizedBox()
                     // ? SharedButton(
                     //     textTheme: _textTheme,
                     //     buttonText: 'Submit',
                     //     buttonColor: ColorResources.accentColor,
                     //     isSending: isSending,
                     //     onPressed: () {
                     //       setState(() {
                     //         isSending = true;
                     //       });
                     //       Future.delayed(Duration(seconds: 3), () {
                     //         Navigator.pushNamed(
                     //             context, RouteHelper.home);
                     //       });
                     //     },
                     //   )
                         : TabButton(
                       tabButtonText: 'Next',
                       onPressed: () => {
                         setState(() => {currentIndex++})
                       },
                     ),
                     SizedBox(
                       height: SizeConfig.screenHeight! * 0.01,
                     ),
                   ],
                 ),
               )

              ],
            ),
          ),
        );
      }),
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

  List<List<Widget>> getTabItems(_textTheme, value, personal, economic) {

    _ageControl.text = personal?.age.toString() ?? '';
    _nameControl.text = value?.name.toString() ?? "";
    _genderControl.text = value?.gender.toString() ?? "";
    _phoneControl.text = value?.phoneNo.toString() ?? "";
    _educationStatusControl.text = personal?.Education_Status.toString() ?? "";
    _marriageStatusControl.text =  personal?.Marriage_Status.toString() ?? "";
    _fieldOfEmployementControl.text = economic?.field_of_employment.toString() ?? "";
    _totalMonthlyIncomeControl.text = economic?.Total_Monthly_Income.toString() ?? "";
    _sourceOfIncomeControl.text = economic?.Source_of_income.toString() ?? "";
    _experienceControl.text = economic?.Experience.toString() ?? "";
    _tinNumberControl.text = value?.TIN_Number.toString() ?? "";
    _numberOfDependentsControl.text = personal?.Number_of_Dependents.toString() ?? "";
    _fullyRepaidLoanControl.text = economic?.fully_repaid_loans.toString() ?? "";
    _emailControl.text = value?.email.toString() ?? "";
    _scoreControl.text = value?.score.toString() ?? "";
    _createdATControl.text = value?.createdAt.toString() ?? "";
    List<List<Widget>> myW = [
      [
        SizedBox(
          height: 15,
        ),
        TabTextField(
            textTheme: _textTheme,
            textEditingController: _nameControl,
            label: 'Name',
            value: value?.name),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _genderControl,
            textTheme: _textTheme,
            label: 'Gender',
            value: value?.gender),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _ageControl,
            textTheme: _textTheme,
            label: 'Age',
            value: personal?.age),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _phoneControl,
            textTheme: _textTheme,
            label: 'Phone Number',
            value: value?.phoneNo),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _scoreControl,
            textTheme: _textTheme,
            label: 'Score',
            value: value?.score),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),


      ],
      [
        SizedBox(
          height: 15,
        ),
        TabTextField(
            textEditingController: _fieldOfEmployementControl,
            textTheme: _textTheme,
            label: 'Field Of Employment',
            value: economic?.field_of_employment),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _totalMonthlyIncomeControl,
            textTheme: _textTheme,
            label: 'Total Monthly Income',
            value: economic?.Total_Monthly_Income),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _sourceOfIncomeControl,
            textTheme: _textTheme,
            label: 'Source Of Income',
            value: economic?.Source_of_income),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _experienceControl,
            textTheme: _textTheme,
            label: 'Experience',
            value: economic?.Experience),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _tinNumberControl,
            textTheme: _textTheme,
            label: 'Tin Number',
            value: value?.TIN_Number),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _numberOfDependentsControl,
            textTheme: _textTheme,
            label: 'Number Of Dependents',
            value: personal?.Number_of_Dependents),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _fullyRepaidLoanControl,
            textTheme: _textTheme,
            label: 'Fully Repaid Loans',
            value: economic?.fully_repaid_loans),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        )
      ],
      [
        SizedBox(
          height: 15,
        ),
        TabTextField(
            textEditingController: _emailControl,
            textTheme: _textTheme,
            label: 'Email',
            value: value?.email),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: _scoreControl,
            textTheme: _textTheme,
            label: 'Score',
            value: value?.score),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
        TabTextField(
            textEditingController: TextEditingController(),
            textTheme: _textTheme,
            label: 'Account Created At',
            value: value?.createdAt),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.03,
        ),
      ],
    ];
    return myW;
  }
}

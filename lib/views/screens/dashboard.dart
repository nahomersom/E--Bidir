import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_bidir/bloc/banks/banks_bloc.dart';
import 'package:e_bidir/bloc/collateral/collaterals_bloc.dart';
import 'package:e_bidir/bloc/login/login_bloc.dart';
import 'package:e_bidir/bloc/user_profile/user_profile_bloc.dart';
import 'package:e_bidir/data/services/local_storage_service.dart';
import 'package:e_bidir/helpers/route_helper.dart';
import 'package:e_bidir/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/my_loan/my_loan_bloc.dart';
import '../../data/api/api_client.dart';
import '../../repositories/user_repo.dart';
import '../../utils/color_resource.dart';
import '../widgets/dasboard_card.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorResources.accentColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listener: (context, state) {
        if (state.userProfileStatus.hasUserProfileError) {
          showSnackBar(context, state, _textTheme);
        }
      }, builder: (context, state) {
        return Scaffold(
          drawerEnableOpenDragGesture: false,
          key: _key,
          drawer: Drawer(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      stops: [
                    0.0,
                    0.5
                  ],
                      colors: [
                    ColorResources.primaryColor,
                    ColorResources.accentColor
                  ])),
              child: SafeArea(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.only(top: 10, left: 8),
                  children: [
                    ListTile(
                      minLeadingWidth: 40,
                      minVerticalPadding: 15,
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(state.userInfo?.profile['url'] ?? ''),
                      ),
                      horizontalTitleGap: 25,
                      title: Text(
                        state.userInfo?.name ?? 'Unknown',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 14),
                      ),
                      subtitle: Text(
                        (state.userInfo?.score.toString() ?? '0') + '  credits',
                        style: _textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorResources.iconBackgroundColor,
                        child: Icon(Icons.group_add, color: Color(0xffAB4747)),
                      ),
                      title: Text(
                        'My Loans',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                        BlocProvider.of<MyLoanBloc>(context).add(GetMyLoans());
                        Navigator.pushNamed(
                          context,
                          RouteHelper.myLoans,
                          arguments: 'My Loans',
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorResources.iconBackgroundColor,
                        child: Icon(Icons.directions_car,
                            color: Color(0xff388AD6)),
                      ),
                      title: Text(
                        'My Collaterals',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                        Navigator.pushNamed(context, RouteHelper.myCollaterals,
                            arguments: 'Collaterals');
                      },
                    ),
                    // SizedBox(height: 10,),
                    // // ListTile(
                    // //   leading: CircleAvatar(
                    // //     backgroundColor: ColorResources.iconBackgroundColor,
                    // //     child: Icon(Icons.account_balance,color: Color(0xff3A58A5)),
                    // //   ),
                    // //   title:  Text('Available Banks',style: _textTheme.titleLarge?.copyWith(
                    // //       fontSize: 18
                    // //   ),),
                    // //   onTap: () {
                    // //     // Update the state of the app.
                    // //     // ...
                    // //     Navigator.pushNamed(context, RouteHelper.availableBanks,  arguments: 'Available Banks',);
                    // //   },
                    // // ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorResources.iconBackgroundColor,
                        child: Icon(Icons.delete, color: Color(0xff8833DD)),
                      ),
                      title: Text(
                        'Deactive Account',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorResources.iconBackgroundColor,
                        child: Icon(Icons.help, color: Color(0xff86C853)),
                      ),
                      title: Text(
                        'Help Center',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorResources.iconBackgroundColor,
                        child: Icon(Icons.logout, color: Color(0xffDA2222)),
                      ),
                      title: Text(
                        'Logout',
                        style: _textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            bodyHeaderDistance: 2,
                            btnOkColor: ColorResources.accentColor,
                            btnCancelColor: ColorResources.ahaduBankColor,
                            animType: AnimType.rightSlide,
                            title: 'Logout',
                            desc: 'Are you Sure you want to Logout',
                            btnCancelOnPress: () {
                              Navigator.pop(context);
                            },
                            btnOkOnPress: () async {
                              await AuthService().removeToken();

                              context.read<LoginBloc>().add(LogoutRequest());

                              Navigator.pushNamed(context, RouteHelper.login);
                            },
                          )..show();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // body: BlocConsumer<BankBloc, BankState>(
          //   listener: (context, state) {
          //     if (state.status.hasError) {
          //       showSnackBar(context, state, _textTheme);
          //     }
          //   },
          //   builder: (context, state) {
          //     return Stack(children: [
          //       Container(
          //         child: Column(
          //           children: [
          //             Container(
          //               height: size.height * 0.91,
          //               decoration: BoxDecoration(
          //                   gradient: LinearGradient(
          //                       begin: Alignment.topCenter,
          //                       end: Alignment.bottomCenter,
          //                       colors: [
          //                     ColorResources.accentColor,
          //                     ColorResources.primaryColor
          //                   ])),
          //               child: SafeArea(
          //                 child: Padding(
          //                   padding: EdgeInsets.only(
          //                       left: screenWidth * 0.05,
          //                       top: screenHeight * 0.02),
          //                   child: Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       IconButton(
          //                         icon: Icon(
          //                           Icons.menu,
          //                           color: ColorResources.scaffoldColor,
          //                           size: 40,
          //                         ),
          //                         onPressed: () =>
          //                             _key.currentState!.openDrawer(),
          //                       ),
          //                       SizedBox(
          //                         width: screenWidth * 0.03,
          //                       ),
          //                       // Expanded(
          //                       //   child: SizedBox(
          //                       //     width: screenWidth * 0.75,
          //                       //     child: Image.asset('assets/images/logo.png'),
          //                       //   ),
          //                       // )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       BlocConsumer<MyLoanBloc, MyLoanState>(
          //         listener: (context, state) {
          //           if (state.status.hasError) {
          //             showSnackBar(context, state, _textTheme);
          //           }
          //         },
          //         builder: (BuildContext context, state) {
          //           return Container(
          //               margin: EdgeInsets.only(top: screenHeight * 0.28),
          //               color: ColorResources.scaffoldColor,
          //               height: screenHeight * 0.8,
          //               width: screenWidth,
          //               child: Padding(
          //                 padding: EdgeInsets.only(top: screenHeight * 0.05),
          //                 child: state.status.isLoading
          //                     ? ListView(children: [
          //                         Padding(
          //                             padding: EdgeInsets.symmetric(
          //                                 horizontal: screenWidth * 0.03),
          //                             child: Text(
          //                               'Loan Status',
          //                               style: _textTheme.headlineMedium,
          //                             )),
          //                         Column(
          //                           children: List.generate(
          //                             4,
          //                             (index) => Column(children: [
          //                               Padding(
          //                                 padding: EdgeInsets.symmetric(
          //                                   horizontal: screenWidth * 0.03,
          //                                 ),
          //                                 child: Shimmer.fromColors(
          //                                     baseColor: Colors.grey.shade300,
          //                                     highlightColor:
          //                                         Colors.grey.shade100,
          //                                     child: Container(
          //                                       height: screenHeight * 0.1,
          //                                       width: double.infinity,
          //                                       color: Colors.white,
          //                                     )),
          //                               ),
          //                               SizedBox(
          //                                 height: 15,
          //                               )
          //                             ]),
          //                           ),
          //                         )
          //                       ])
          //                     : ListView(children: [
          //                         Padding(
          //                             padding: EdgeInsets.symmetric(
          //                                 horizontal: screenWidth * 0.03),
          //                             child: Text(
          //                               'Loan Status',
          //                               style: _textTheme.headlineMedium,
          //                             )),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.symmetric(
          //                             horizontal: screenWidth * 0.03,
          //                           ),
          //                           child: Container(
          //                             width: double.infinity,
          //                             height: screenHeight * 0.1,
          //                             decoration: BoxDecoration(
          //                               color: ColorResources.scaffoldColor,
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: ColorResources.blurColor,
          //                                   blurRadius: 2,
          //                                   offset:
          //                                       Offset(0, 1), // Shadow position
          //                                 ),
          //                               ],
          //                             ),
          //                             child: Padding(
          //                               padding: EdgeInsets.all(10),
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Column(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.center,
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       Text(
          //                                         'Approved',
          //                                         style: _textTheme.titleSmall
          //                                             ?.copyWith(
          //                                           fontWeight: FontWeight.w600,
          //                                           color: ColorResources
          //                                               .secondaryColor,
          //                                         ),
          //                                       ),
          //                                       SizedBox(height: 4),
          //                                       Text(
          //                                         'Approved by all banks',
          //                                         style: _textTheme.labelMedium
          //                                             ?.copyWith(
          //                                                 color: ColorResources
          //                                                     .lightStatusTextColor),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Text(
          //                                     state.myLoanStatus[1]['approved']
          //                                         .toString(),
          //                                     style: _textTheme.titleSmall
          //                                         ?.copyWith(
          //                                             color: ColorResources
          //                                                 .secondaryColor),
          //                                   )
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.symmetric(
          //                             horizontal: screenWidth * 0.03,
          //                           ),
          //                           child: Container(
          //                             width: double.infinity,
          //                             height: screenHeight * 0.1,
          //                             decoration: BoxDecoration(
          //                               color: ColorResources.scaffoldColor,
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: ColorResources.blurColor,
          //                                   blurRadius: 2,
          //                                   offset:
          //                                       Offset(0, 1), // Shadow position
          //                                 ),
          //                               ],
          //                             ),
          //                             child: Padding(
          //                               padding: EdgeInsets.all(10),
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Column(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.center,
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       Text(
          //                                         'Pending',
          //                                         style: _textTheme.titleSmall
          //                                             ?.copyWith(
          //                                           fontWeight: FontWeight.w600,
          //                                           color: ColorResources
          //                                               .secondaryColor,
          //                                         ),
          //                                       ),
          //                                       SizedBox(height: 4),
          //                                       Text(
          //                                         'Waiting Approval',
          //                                         style: _textTheme.labelMedium
          //                                             ?.copyWith(
          //                                                 color: ColorResources
          //                                                     .lightStatusTextColor),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Text(
          //                                     state.myLoanStatus[0]['pending']
          //                                         .toString(),
          //                                     style: _textTheme.titleSmall
          //                                         ?.copyWith(
          //                                             color: ColorResources
          //                                                 .secondaryColor),
          //                                   )
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.symmetric(
          //                             horizontal: screenWidth * 0.03,
          //                           ),
          //                           child: Container(
          //                             width: double.infinity,
          //                             height: screenHeight * 0.1,
          //                             decoration: BoxDecoration(
          //                               color: ColorResources.scaffoldColor,
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: ColorResources.blurColor,
          //                                   blurRadius: 2,
          //                                   offset:
          //                                       Offset(0, 1), // Shadow position
          //                                 ),
          //                               ],
          //                             ),
          //                             child: Padding(
          //                               padding: EdgeInsets.all(10),
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Column(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.center,
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       Text(
          //                                         'Declined',
          //                                         style: _textTheme.titleSmall
          //                                             ?.copyWith(
          //                                           fontWeight: FontWeight.w600,
          //                                           color: ColorResources
          //                                               .secondaryColor,
          //                                         ),
          //                                       ),
          //                                       SizedBox(height: 4),
          //                                       Text(
          //                                         'Declined by banks',
          //                                         style: _textTheme.labelMedium
          //                                             ?.copyWith(
          //                                                 color: ColorResources
          //                                                     .lightStatusTextColor),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Text(
          //                                     state.myLoanStatus[3]['declined']
          //                                         .toString(),
          //                                     style: _textTheme.titleSmall
          //                                         ?.copyWith(
          //                                             color: ColorResources
          //                                                 .secondaryColor),
          //                                   )
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.symmetric(
          //                             horizontal: screenWidth * 0.03,
          //                           ),
          //                           child: Container(
          //                             width: double.infinity,
          //                             height: screenHeight * 0.1,
          //                             decoration: BoxDecoration(
          //                               color: ColorResources.scaffoldColor,
          //                               boxShadow: [
          //                                 BoxShadow(
          //                                   color: ColorResources.blurColor,
          //                                   blurRadius: 2,
          //                                   offset:
          //                                       Offset(0, 1), // Shadow position
          //                                 ),
          //                               ],
          //                             ),
          //                             child: Padding(
          //                               padding: EdgeInsets.all(10),
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Column(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.center,
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       Text(
          //                                         'Closed',
          //                                         style: _textTheme.titleSmall
          //                                             ?.copyWith(
          //                                           fontWeight: FontWeight.w600,
          //                                           color: ColorResources
          //                                               .secondaryColor,
          //                                         ),
          //                                       ),
          //                                       SizedBox(height: 4),
          //                                       Text(
          //                                         'Fully Paid Loans',
          //                                         style: _textTheme.labelMedium
          //                                             ?.copyWith(
          //                                                 color: ColorResources
          //                                                     .lightStatusTextColor),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Text(
          //                                     state.myLoanStatus[2]['closed']
          //                                         .toString(),
          //                                     style: _textTheme.titleSmall
          //                                         ?.copyWith(
          //                                             color: ColorResources
          //                                                 .secondaryColor),
          //                                   )
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 5,
          //                         ),
          //                       ]),
          //               ));
          //         },
          //       ),
          //       state.status.isLoading
          //           ? DashboardCard(
          //               screenHeight: screenHeight,
          //               screenWidth: screenWidth,
          //               textTheme: _textTheme)
          //           : state.status.isSuccess
          //               ? DashboardCard(
          //                   screenHeight: screenHeight,
          //                   screenWidth: screenWidth,
          //                   textTheme: _textTheme,
          //                   hasData: true,
          //                   bankInfo: state.bankInfo,
          //                 )
          //               : DashboardCard(
          //                   screenHeight: screenHeight,
          //                   screenWidth: screenWidth,
          //                   textTheme: _textTheme,
          //                   hasData: false)
          //     ]);
          //   },
          // ),

          body: ListView(children: [
            Stack(
              children: [
                Container(
                  height: screenWidth * 0.6,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: ColorResources.scaffoldColor,
                              size: 30,
                            ),
                            onPressed: () => _key.currentState!.openDrawer(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              state.userInfo?.name ?? '_',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: ColorResources.scaffoldColor),
                            ),
                          ),
                        ]),
                  ),
                  decoration: BoxDecoration(
                      color: ColorResources.accentColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Padding(
                  padding: EdgeInsets.all(23),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: screenHeight * 0.28,
                          margin: EdgeInsets.only(top: screenHeight * 0.115),
                          decoration: BoxDecoration(
                              color: ColorResources.cardColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12, offset: Offset(1, 5))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 14, right: 20, top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Total Credits',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff444445)),
                                          ),
                                        ),
                                        Row(children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '29 Birr',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff727387)),
                                          )
                                        ])
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Total Score',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff444445)),
                                          ),
                                        ),
                                        Row(children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            state.userInfo?.score.toString() ??
                                                '_',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff727387)),
                                          )
                                        ])
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color:
                                    ColorResources.accentColor.withOpacity(0.2),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: BlocConsumer<MyLoanBloc, MyLoanState>(
                                    listener: (context, state) {
                                  if (state.status.hasError) {
                                    showSnackBar(context, state, _textTheme);
                                  }
                                }, builder: (context, state) {
                                  return state.status.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                          color: ColorResources.accentColor,
                                        ))
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total pending Loans             ${state.myLoanStatus[0]['pending'].toString()} ',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff66676c)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                'Total Declined Loans :           ${state.myLoanStatus[3]['declined'].toString()}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff66676c))),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                'Total Closed Loans :               ${state.myLoanStatus[2]['closed'].toString()}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff66676c))),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                'Total Approved Loans :         ${state.myLoanStatus[1]['approved'].toString()}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff66676c))),
                                          ],
                                        );
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Quick Links',
                              style: _textTheme.titleMedium?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorResources.accentColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(233, 207, 213, 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.account_balance,
                                              color: Color(0xffF4EFF1),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.014,
                                            ),
                                            Text(
                                              'My Loans',
                                              style: _textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color(0xffF4EFF1)),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffB7C9C5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.directions_car,
                                              color: Color(0xffF4EFF1),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.014,
                                            ),
                                            Text(
                                              'My Collaterals',
                                              style: _textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18,
                                                      color: Color(0xffF4EFF1)),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffa8b9c9),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.help,
                                              color: Color(0xffF4EFF1),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.014,
                                            ),
                                            Text(
                                              'Help Center',
                                              style: _textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color(0xffF4EFF1)),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffccd9f8),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.account_box_outlined,
                                              color: Color(0xffF4EFF1),
                                              size: 50,
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.014,
                                            ),
                                            Text(
                                              'About Us',
                                              style: _textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color(0xffF4EFF1)),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                ),
              ],
            )
          ]),
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
}

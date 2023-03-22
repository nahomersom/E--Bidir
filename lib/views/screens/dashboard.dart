
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
        ),
      child: 
      Scaffold(
        drawerEnableOpenDragGesture: false,
        key: _key,
        drawer: Drawer(
          child: Container(
            height: double.infinity,
                    decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
            stops: [0.0,0.5],

            colors: [ColorResources.primaryColor,ColorResources.accentColor]
            )
                    ),



          child: SafeArea(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.only(top:10,left: 8),
              children: [
               ListTile(
                minLeadingWidth: 40,
                 minVerticalPadding: 15,
                 leading: CircleAvatar(
                   radius: 30,
            backgroundImage: AssetImage('assets/images/user.jpg'),

          ),
                 horizontalTitleGap: 25,

                 title: Text('Jhon Doe',style: _textTheme.titleLarge?.copyWith(
                   fontSize: 24
                 ),),
                 subtitle: Text('20.2 credits',style: _textTheme.labelMedium,
                 ),
               ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.group_add,color: Color(0xffAB4747)),
                  ),
                  title:  Text('My Loans',style: _textTheme.titleLarge?.copyWith(
                    fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.directions_car,color: Color(0xff388AD6)),
                  ),
                  title:  Text('My Collaterals',style: _textTheme.titleLarge?.copyWith(
                      fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.account_balance,color: Color(0xff3A58A5)),
                  ),
                  title:  Text('Available Banks',style: _textTheme.titleLarge?.copyWith(
                      fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.delete,color: Color(0xff8833DD)),
                  ),
                  title:  Text('Deactive Account',style: _textTheme.titleLarge?.copyWith(
                      fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.help,color: Color(0xff86C853)),
                  ),
                  title:  Text('Help Center',style: _textTheme.titleLarge?.copyWith(
                      fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorResources.iconBackgroundColor,
                    child: Icon(Icons.logout,color: Color(0xffDA2222)),
                  ),
                  title:  Text('Logout',style: _textTheme.titleLarge?.copyWith(
                      fontSize: 18
                  ),),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
        ),
        ),
        body: Stack(

          children:[
            Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.91,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [ColorResources.accentColor,ColorResources.primaryColor]
                        )

                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05,top: screenHeight * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                icon: Icon(Icons.menu,color: ColorResources.scaffoldColor,size: 40,),
                                onPressed: () => _key.currentState!.openDrawer(),
                            ),

                           SizedBox(width: screenWidth * 0.05,),
                           SizedBox(
                             width: screenWidth * 0.75,
                             child:  Image.asset('assets/images/logo.png'),
                           )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight * 0.37),
                color:ColorResources.scaffoldColor,
              height: screenHeight * 0.6,
              width: screenWidth,
              child: Container(
                margin: EdgeInsets.only(top: screenHeight * 0.15,left:  screenWidth * 0.05,right:  screenWidth * 0.05,bottom: screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text('Loan Status',style: _textTheme.headlineMedium,),
                      SizedBox(height: 10,),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                           height: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorResources.scaffoldColor,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.blurColor,
                                  blurRadius: 2,
                                  offset: Offset(0, 1), // Shadow position
                                ),
                              ],
                        ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text('Approved',style: _textTheme.titleSmall?.copyWith(
                                        color: ColorResources.approvedColor,
                                      ),),
                                    ),
                                    Expanded(
                                      child:    Text('27 jan 2023',style: _textTheme.labelMedium?.copyWith(
                                          color: ColorResources.lightStatusTextColor
                                      ),),
                                    )

                                  ],
                                ),
                                Text('3000',style: _textTheme.titleSmall?.copyWith(
                                  color: ColorResources.accentColor
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorResources.scaffoldColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.blurColor,
                                blurRadius: 2,
                                offset: Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text('Pending',style: _textTheme.titleSmall?.copyWith(
                                        color: ColorResources.pendingColor,
                                      ),),
                                    ),
                                    Expanded(
                                      child:  Text('27 jan 2023',style: _textTheme.labelMedium?.copyWith(
                                          color: ColorResources.lightStatusTextColor
                                      ),),
                                    )
                                   
                                  ],
                                ),
                                Text('3000',style: _textTheme.titleSmall?.copyWith(
                                    color: ColorResources.accentColor
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorResources.scaffoldColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.blurColor,
                                blurRadius: 2,
                                offset: Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text('Rejected',style: _textTheme.titleSmall?.copyWith(
                                        color: ColorResources.rejectedColor,
                                      ),),
                                    ),
                                    Expanded(
                                      child:   Text('27 jan 2023',style: _textTheme.labelMedium?.copyWith(
                                          color: ColorResources.lightStatusTextColor
                                      ),),
                                    )

                                  ],
                                ),
                                Text('3000',style: _textTheme.titleSmall?.copyWith(
                                    color: ColorResources.accentColor
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.26),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashboardCard(screenHeight: screenHeight, screenWidth: screenWidth, textTheme: _textTheme),
                    DashboardCard(screenHeight: screenHeight, screenWidth: screenWidth, textTheme: _textTheme),
                  ],
                ),
              ),
            ),


          ]

        ),
      ),
    );
  }
}


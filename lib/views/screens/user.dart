import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  List<String> tabText = ['User Info','Additional','Account'];
  int currentIndex = 0;
  bool isSending = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;
    List<List<Widget>> myW = [
      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'First Name',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Middle Name',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Last Name',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Gender',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Age',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Phone Number',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Email',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Tin Number',),

      ],


      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Field Of Employment',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Source Of Income',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Experience',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Number Of Loans',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Fully Repaid Loans',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Total Monthly Income',),
      ],
      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Field Of Employment',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Source Of Income',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Experience',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Number Of Loans',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Fully Repaid Loans',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Total Monthly Income',),
      ],

    ];
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.08,vertical: SizeConfig.screenHeight! * 0.03),
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: ()=>    Navigator.pushReplacementNamed(context, RouteHelper.home),
                    icon:Icon(Icons.arrow_back_sharp,weight: 30,
                      size: 40,),
                    color: ColorResources.accentColor,)),
              Text('User Profile',style: _textTheme.headlineSmall?.copyWith(
                  color: ColorResources.accentColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
              Container(
                height: SizeConfig.screenHeight! * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabText.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10,right: SizeConfig.screenWidth! * 0.1,top: 10,bottom: 5),
                      child: Column(

                        children: [
                          GestureDetector(
                                  onTap:()=>{
                                  setState(()=>{
                                  currentIndex = index
                                  })},
                            child: Container(
                              height: SizeConfig.screenHeight! * 0.08,
                              width: SizeConfig.screenHeight! * 0.08,
                              decoration:  currentIndex == index ?
                              BoxDecoration(
                                  color:ColorResources.accentColor,
                                  border: Border.all(
                                      color: ColorResources.accentColor,
                                      width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(100)
                              ) :    BoxDecoration(

                                  border: Border.all(
                                      color: ColorResources.accentColor,
                                      width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                  child: Text((index + 1).toString(),
                                    style: _textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: currentIndex == index ? ColorResources.scaffoldColor:ColorResources.accentColor
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          Text(tabText[index],style: _textTheme.labelMedium?.copyWith(
                              color: currentIndex == index ? ColorResources.accentColor : ColorResources.lightStatusTextColor,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    );
                  },

                ),
              ),
              SizedBox(height: 15,),
             currentIndex == 0 ? Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.jpg'),

                )
              ):SizedBox(),
             currentIndex == 0 ? SizedBox(height: 15,) : SizedBox(),
              currentIndex == 0 ? Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.08),
                child:
                    InkWell(
                      onTap: ()=>{},
                      child:  Container(
                        height: SizeConfig.screenHeight! * 0.05,
                        child: Center(
                          child: Text(
                            'Set a new photo',
                            style: _textTheme.titleSmall,
                            textAlign: TextAlign.center,

                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    )

              ):SizedBox(),
              currentIndex == 0 ? SizedBox(height: 10,) : SizedBox(),
              Column(
                  children: myW[currentIndex]
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.03,),
              currentIndex == 3 ?
              SharedButton(
                textTheme: _textTheme,
                buttonText: 'Submit',
                buttonColor: ColorResources.accentColor,
                isSending:isSending,
                onPressed: (){
                  setState(() {
                    isSending = true;
                  });
                  Future.delayed(Duration(seconds: 3),(){
                    Navigator.pushReplacementNamed(context, RouteHelper.home);
                  });

                },
              ):
              TabButton(
                onPressed: ()=>{
                  setState(()=>{
                    currentIndex++
                  })
                },
              ),

              SizedBox(height: SizeConfig.screenHeight! * 0.01,),


            ],
          ),
        ),
      ),
    );
  }
}

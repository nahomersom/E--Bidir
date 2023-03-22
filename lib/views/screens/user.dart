import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_resource.dart';
import '../../utils/size_config.dart';
import '../widgets/tab_text_field.dart';
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> tabText = ['Personal','Loan','Economic'];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;
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
                  child: Icon(Icons.arrow_back_sharp,
                    weight: 30,
                    size: 40,color: ColorResources.accentColor,)),
              Text('User Profile',style: _textTheme.headlineSmall?.copyWith(
                  color: ColorResources.accentColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
              Container(
                height: SizeConfig.screenHeight! * 0.13,
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
                          Container(
                            height: SizeConfig.screenHeight! * 0.08,
                            width: SizeConfig.screenHeight! * 0.08,
                            decoration: BoxDecoration(
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
                                      color: ColorResources.accentColor
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          Text(tabText[index],style: _textTheme.labelMedium?.copyWith(
                              color: ColorResources.lightStatusTextColor,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    );
                  },

                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.jpg'),

                )
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.03,),
              TabTextField(textTheme: _textTheme,label: 'Educational Status',),
              SizedBox(height: SizeConfig.screenHeight! * 0.03,),
              TabTextField(textTheme: _textTheme,label: 'Criminal Records',),
              SizedBox(height: SizeConfig.screenHeight! * 0.03,),
              TabTextField(textTheme: _textTheme,label: 'Dependents',),


            ],
          ),
        ),
      ),
    );
  }
}

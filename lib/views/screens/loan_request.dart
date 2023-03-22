import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/tab_text_field.dart';

class LoanRequest  extends StatefulWidget {
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  List<String> tabText = ['Personal','Loan','Economic','Collateral'];
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
           Text('Loan Request',style: _textTheme.headlineSmall?.copyWith(
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
                return Column(
                  children: [
                   Container(
                     height: SizeConfig.screenHeight! * 0.08,
                     width: SizeConfig.screenHeight! * 0.08,
                     margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
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
                );
               },

             ),
           ),
           SizedBox(height: 15,),
           TabTextField(textTheme: _textTheme,label: 'Age',),
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


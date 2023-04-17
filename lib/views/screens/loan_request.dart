import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/route_helper.dart';
import '../widgets/shared_button.dart';
import '../widgets/tab_button.dart';
import '../widgets/tab_text_field.dart';

class LoanRequest  extends StatefulWidget {
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  List<String> tabText = ['Personal','Loan','Economic','Collateral'];
  int currentIndex = 0;
  bool isSending = false;
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;
    List<List<Widget>> myW = [
       [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Age',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Educational Status',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         TabTextField(textTheme: _textTheme,label: 'Marriage Status',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Criminal Records',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: ' Number of Dependents',),
      ],

       [
       SizedBox(height: 15,),
      TabTextField(textTheme: _textTheme,label: 'Loan Amount',),
      SizedBox(height: SizeConfig.screenHeight! * 0.03,),
      TabTextField(textTheme: _textTheme,label: 'Reason For Loan',),
      SizedBox(height: SizeConfig.screenHeight! * 0.03,),
      TabTextField(textTheme: _textTheme,label: 'Loan Payment Period',),
      SizedBox(height: SizeConfig.screenHeight! * 0.03,),
      TabTextField(textTheme: _textTheme,label: 'Job Status',),
      SizedBox(height: SizeConfig.screenHeight! * 0.03,),
      TabTextField(textTheme: _textTheme,label: 'Bank',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         TabTextField(textTheme: _textTheme,label: 'Type Of Loan',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         TabTextField(textTheme: _textTheme,label: 'Type Of Collateral',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         TabTextField(textTheme: _textTheme,label: 'Monthly Payment',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         TabTextField(textTheme: _textTheme,label: 'Interest',),
         SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         // TabTextField(textTheme: _textTheme,label: 'Status',),
         // SizedBox(height: SizeConfig.screenHeight! * 0.03,),
         // TabTextField(textTheme: _textTheme,label: 'Score',),
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
        TabTextField(textTheme: _textTheme,label: 'Type Of Vehicle',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Brand',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Model',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Year',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Country',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Cylinder',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Car Score',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Plate Number',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Horse Power',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Transportation Capacity',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Millage(Km)',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Collateral_Coverage_Ratio',),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Car Image',),

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
           Text('Loan Request',style: _textTheme.headlineSmall?.copyWith(
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
                return Column(
                  children: [
                   GestureDetector(
                     onTap:()=>{
                  setState(()=>{
                       currentIndex = index
                     })
                },
                     child: Container(
                       height: SizeConfig.screenHeight! * 0.08,
                       width: SizeConfig.screenHeight! * 0.08,
                       margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
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
                    Text(
                      tabText[index],
                      style: _textTheme.labelMedium?.copyWith(
                      color: currentIndex == index ? ColorResources.accentColor : ColorResources.lightStatusTextColor,
                      fontWeight: FontWeight.w700
                    ),),

                  ],
                );
               },

             ),
           ),
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


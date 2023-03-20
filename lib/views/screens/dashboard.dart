
import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Stack(
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
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:screenHeight * 0.37),
              color:ColorResources.scaffoldColor
        ),
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.26),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: screenHeight * 0.23,
                        width:screenWidth * 0.7,
                        child: Container(
                          margin: EdgeInsets.only(left: 150,bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Ahadu Bank',style: _textTheme.titleLarge?.copyWith(
                                fontSize: 19
                              ),),
                              Text('+251923232333',style: _textTheme.labelMedium),
                             RichText(

                               text: TextSpan(
                                 text:'100',
                                 style: _textTheme.labelMedium?.copyWith(
                                   fontWeight: FontWeight.w700
                                 ),
                                 children: [
                                   WidgetSpan(
                                     child: SizedBox(width: 3),
                                   ),
                                   TextSpan(text:'Users',style: _textTheme.labelMedium,)
                                 ]
                               )
                             )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: ColorResources.blurColor,
                          //     blurRadius: 4,
                          //     offset: Offset(0, 4), // Shadow position
                          //   ),
                          // ],
                          color: ColorResources.ahaduBankColor,
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.23,
                        width: screenWidth * 0.33,
                        decoration: BoxDecoration(

                          color: ColorResources.scaffoldColor,
                        ),
                        child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Image.asset(
                            'assets/images/ahadu.png',


                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ]

    );
  }
}

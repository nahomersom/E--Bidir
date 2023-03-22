import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required TextTheme textTheme,
  }) : _textTheme = textTheme;

  final double screenHeight;
  final double screenWidth;
  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Container(
            height: screenHeight * 0.23,
            width:screenWidth * 0.7,
            child: Container(
              margin: EdgeInsets.only(left: screenWidth * 0.336,bottom: 30),
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
              boxShadow: [
                BoxShadow(
                  color: ColorResources.blurColor,
                  blurRadius: 4,
                  offset: Offset(0, 6), // Shadow position
                ),
              ],
              color: ColorResources.ahaduBankColor,
            ),
          ),
          Container(
            height: screenHeight * 0.23,
            width: screenWidth * 0.33,
            decoration: BoxDecoration(

              color: ColorResources.scaffoldColor,
              boxShadow: [
                BoxShadow(
                  color: ColorResources.blurColor,
                  blurRadius: 4,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
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
    );
  }
}

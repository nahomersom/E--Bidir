import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/model/bank/bank_info.dart';
import '../../utils/color_resource.dart';
class DashboardCard extends StatelessWidget {
   DashboardCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
     this.bankInfo,
    required TextTheme textTheme,
     this.hasData = false,

  }) : _textTheme = textTheme;

  final double screenHeight;
  final double screenWidth;
  List<BankInfo>? bankInfo = [];

  final TextTheme _textTheme;
  bool hasData;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(top: screenHeight * 0.26),
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: hasData && bankInfo != [] ?  Row(
              children: List.generate(bankInfo!.length, (index) =>
       Padding(
        padding: EdgeInsets.all(10),
        child:
         Stack(
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
                    Text(bankInfo![index].bank_name,style: _textTheme.titleLarge?.copyWith(
                        fontSize: 19
                    ),),
                    Text(bankInfo![index].bank_phoneNo,style: _textTheme.labelMedium),
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
                child: Image.network(
                  bankInfo![index].logo['url'],
                 
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: const Icon(Icons.account_balance,size: 50,)
                    );
                  },


                ),
              ),
            ),
          ],
        )
      ),
              )
    ) :
        Row(
          children:List.generate(2, (index) => Padding(
            padding: EdgeInsets.all(10),
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child:Container(
                  height: screenHeight * 0.23,
                  width:screenWidth * 0.7,
                  color: Colors.white,
                )

            ),
          ))

        )
      ),
    );
  }
}

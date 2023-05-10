import 'package:e_bidir/helpers/route_helper.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../widgets/shared_button.dart';
class LoanSuccessScreen extends StatelessWidget {

  const LoanSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           // FaIcon(
           //   FontAwesomeIcons.solidCircleCheck,
           //   size: 100,
           //   color: ColorResources.accentColor,
           // )
           Lottie.asset('assets/animations/success.json',height: 350),
            Text('Successful',style: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorResources.accentColor,
              fontSize: 30
            ),),
           Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('Your loan request has been sent out successfully.')),
           SizedBox(height: 50,),
           SizedBox(
             width: double.infinity,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: SharedButton(
                 textTheme: _textTheme,
                 buttonText: 'Go back Home',
                 buttonColor: ColorResources.accentColor,
                 fontSize: 16,
                 onPressed: ()=>{
                   Navigator.pushReplacementNamed(context, RouteHelper.home)
                 },
               ),
             ),
           ),
         ],
        ),
      ),
    );
  }
}

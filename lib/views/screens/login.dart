import 'package:e_bidir/helpers/route_helper.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/utils/side_constants.dart';
import 'package:e_bidir/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/shared_button.dart';
import '../widgets/shared_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.05,
            horizontal: screenWidth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage('assets/images/logo.png')),
            SizedBox(height: screenHeight * 0.04,),
            Text(
              'Hello! let\'s get started',
              style: _textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.025,),
            SharedTextField(
              textTheme: _textTheme,
              label: 'Phone No',
              placeholder: 'phoneNo',
              prefixIcon: Icon(Icons.phone,color: ColorResources.secondaryColor,)
            ),
            SizedBox(height: screenHeight * 0.03,),
            SharedTextField(
              textTheme: _textTheme,
              label: 'Password',
              placeholder: 'password',
                prefixIcon: Icon(Icons.person_add,color: ColorResources.secondaryColor,)
            ),
            SizedBox(height: screenHeight * 0.03,),
            SharedButton(
              textTheme: _textTheme,
              buttonText: 'Sign in',
              buttonColor: ColorResources.accentColor,
              onPressed: (){
                Navigator.pushReplacementNamed(context, RouteHelper.home);
              },
            ),
            SizedBox(height: screenHeight * 0.023,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   Checkbox(value: false, onChanged:null),
                    Text('keep me signed in',style:TextStyle(
                      color: ColorResources.lightTextColor
                    ) ,)
                  ],
                ),
                InkWell(
                  child: Text('Forget Password?',style: _textTheme.labelMedium?.copyWith(
                    color: ColorResources.linkColor
                  ),),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.015,),
            SharedButton(
                textTheme: _textTheme,
                buttonText: 'Connect using Google',
                buttonColor: ColorResources.primaryColor,
              fontSize: 16,
            ),
            SizedBox(height: screenHeight * 0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                 style: _textTheme.titleMedium,
                  children:  [
                    const  WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(text: 'Create',
                        style: _textTheme.titleMedium?.copyWith(
                      color: ColorResources.linkColor
                    ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Single tapped.
                      },
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}



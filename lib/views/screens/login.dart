import 'package:e_bidir/helpers/route_helper.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/shared_button.dart';
import '../widgets/shared_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
   bool isSending = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
           
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.08,
            right: screenWidth * 0.08,
          ),
          child: Form(
            key: _formKey,
            child: ListView(

              children: [
                Expanded(child: Image(image: AssetImage('assets/images/logo.png'))),

                SizedBox(height: screenHeight * 0.03,),
                Expanded(
                  child:  Text(
                    'Hello! let\'s get started',
                    style: _textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ) ,
                SizedBox(height: screenHeight * 0.025,),
                Expanded(
                  child: SharedTextField(
                    textTheme: _textTheme,
                    textEditingController: _phoneNumberControl,
                    label: 'Phone No',
                    placeholder: 'phoneNo',
                    inputType: 'phone',
                    prefixIcon: Icon(Icons.phone,color: ColorResources.secondaryColor,)
                  ),
                ),
                SizedBox(height: screenHeight * 0.03,),
                Expanded(
                  child: SharedTextField(
                    textTheme: _textTheme,
                    textEditingController: _passwordControl,
                    label: 'Password',
                    placeholder: 'password',
                      prefixIcon: Icon(Icons.person_add,color: ColorResources.secondaryColor,)
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SharedButton(
                  textTheme: _textTheme,
                  buttonText: 'Sign in',
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
                ),
                // SizedBox(height: screenHeight * 0.023,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Checkbox(value: false, onChanged:null),
                          Text('keep me signed in',style:TextStyle(
                            color: ColorResources.lightTextColor
                          ) ,)
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.06,),
                      Expanded(
                        child: InkWell(
                          child: Text('Forget Password?',style: _textTheme.labelMedium?.copyWith(
                            color: ColorResources.linkColor
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.015,),
                SharedButton(
                    textTheme: _textTheme,
                    buttonText: 'Connect using Google',
                    buttonColor: ColorResources.primaryColor,
                  fontSize: 16,
                ),
                SizedBox(height: screenHeight * 0.02,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                       style: _textTheme.titleMedium,
                        children:  [
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
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}



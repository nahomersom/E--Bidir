import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/color_resource.dart';
import 'loan_request.dart';
class LoanLanding extends StatelessWidget {
  const LoanLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child:  Scaffold(
        body: ListView(
          children: [
            SizedBox(height: screenHeight* 0.1,),
            SvgPicture.asset(
              "assets/svgs/onboarding-02.svg",
                height: screenHeight * 0.42,
                fit: BoxFit.scaleDown
            ),
            SizedBox(height: screenHeight* 0.1,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "E-Bidir, provides an easy way to request a loan with a simple and straight forward way.",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  backgroundColor: ColorResources.accentColor,
                ),

                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoanRequest()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  "Make a request",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

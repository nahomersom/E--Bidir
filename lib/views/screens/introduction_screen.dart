import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class IntroSCreen extends StatefulWidget {
  const IntroSCreen({super.key});

  @override
  IntroSCreenState createState() => IntroSCreenState();
}

class IntroSCreenState extends State<IntroSCreen> {
  final _controllerP = PageController();
  var sizeW;
  var sizeH;
  var enabledFeatured = 0;
  var disabledColor = ColorResources.accentColor.withOpacity(0.3);

  List<Widget> _widgets = [
    SvgPicture.asset(
      "assets/svgs/onboarding-01.svg",
      fit: BoxFit.contain,
    ),
    SvgPicture.asset(
      "assets/svgs/onboarding-02.svg",
      fit: BoxFit.contain,
    ),
    SvgPicture.asset(
      "assets/svgs/onboarding-03.svg",
      fit: BoxFit.contain,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 396,
            width: sizeW,
            child: Column(
              children: <Widget>[
                SizedBox(height: 14.4),
                Container(
                  padding: EdgeInsets.symmetric(vertical: sizeW * 0.04),
                  height: 360,
                  width: sizeW,
                  child: PageView.builder(
                    itemCount: _widgets.length,
                    controller: _controllerP, // assign it to PageView
                    itemBuilder: (context, index) {
                      return _widgets[index];
                    },
                    onPageChanged: (i) {
                      setState(() {
                        enabledFeatured = i;
                      });
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    List<Widget>.generate(_widgets.length, (int index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: enabledFeatured == index
                                ? ColorResources.secondaryColor
                                : disabledColor,
                          ),
                          width: 18,
                          height: 6.48,
                        ),
                      );
                    }))
              ],
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "E-Bidir,have been developed an online platform to apply for loan.",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                backgroundColor: ColorResources.accentColor,
              ),
              onPressed: () {

                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));

              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

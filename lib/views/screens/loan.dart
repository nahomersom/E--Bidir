import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
class Loan extends StatelessWidget {
  const Loan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Container(
      child: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: 191,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ColorResources.accentColor,ColorResources.primaryColor]
                  )

              ),
            ),
            Container(
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ColorResources.accentColor,ColorResources.primaryColor]
                  )

              ),
            )
          ],
        ),
      ),

    );
  }
}


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
    return Container(
      child: Container(
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

    );
  }
}

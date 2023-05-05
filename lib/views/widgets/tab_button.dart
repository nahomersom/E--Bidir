import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/side_constants.dart';
class TabButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isSending;
  final String tabButtonText;
  const TabButton({Key? key, this.onPressed, this.isSending = false,this.tabButtonText = 'Update'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    return SizedBox(height: screenHeight * 0.05,
      child:  ElevatedButton(
        onPressed:isSending ? null : onPressed,
        child: !isSending ? Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding: EdgeInsets.only(left: 70),
              child: Text(tabButtonText,style: _textTheme.titleLarge?.copyWith(
                  fontSize: 20,

              ),

              ),
            ),

            Icon(Icons.arrow_forward,)
          ],
        ) :  const SpinKitWave(
          color: ColorResources.scaffoldColor,
          size: 50.0,
        ),

        style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(ColorResources.accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SideConstants.borderRadius)
                )
            )
        ),
      ),
    );
  }
}

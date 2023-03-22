import 'package:e_bidir/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/color_resource.dart';
import '../../utils/side_constants.dart';

class SharedButton extends StatelessWidget {
   SharedButton({
    super.key,
    required TextTheme textTheme,
     required this.buttonText,
     required this.buttonColor,
     this.onPressed,
     this.isSending = false,
   this.fontSize = 20
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;
  final String buttonText;
  final Color buttonColor;
 final double fontSize;
 final bool isSending;

 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    return SizedBox(height: screenHeight * 0.07,
      child:  ElevatedButton(
        onPressed:isSending ? null : onPressed,
        child: !isSending ? Text(buttonText,style: _textTheme.titleLarge?.copyWith(
          fontSize: fontSize
        )): const SpinKitWave(
          color: ColorResources.scaffoldColor,
          size: 50.0,
        ),
        style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(buttonColor),
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

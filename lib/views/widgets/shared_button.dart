import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
import '../../utils/side_constants.dart';

class SharedButton extends StatelessWidget {
   SharedButton({
    super.key,
    required TextTheme textTheme,
     required this.buttonText,
     required this.buttonColor,
     this.onPressed,
   this.fontSize = 20
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;
  final String buttonText;
  final Color buttonColor;
 final double fontSize;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 55,
      child:  ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText,style: _textTheme.titleLarge?.copyWith(
          fontSize: fontSize
        )),
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

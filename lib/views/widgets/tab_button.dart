import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';

import '../../utils/side_constants.dart';
class TabButton extends StatelessWidget {
  final void Function()? onPressed;
  const TabButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    return SizedBox(height: screenHeight * 0.07,
      child:  ElevatedButton(
        onPressed: onPressed ?? null,
        child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding: EdgeInsets.only(left: 70),
              child: Text('Next',style: _textTheme.titleLarge?.copyWith(
                  fontSize: 22,

              ),

              ),
            ),

            Icon(Icons.arrow_forward,)
          ],
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

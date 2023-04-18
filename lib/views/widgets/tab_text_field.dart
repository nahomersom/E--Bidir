import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
import '../../utils/size_config.dart';
class TabTextField extends StatelessWidget {
   TabTextField({
    super.key,
    required TextTheme textTheme,
    required this.label,
    this.value
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;
  final String label;
  dynamic value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(label,style: _textTheme.labelLarge?.copyWith(
              color: Colors.black,
            fontWeight: FontWeight.w500
          ),),
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.02,),
        TextField(
          readOnly: true,

          decoration: InputDecoration(
            filled: true,
            hintText: value.toString()
                ?? '',
            fillColor: ColorResources.textFieldColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorResources.textFieldColor,
                )
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorResources.textFieldColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorResources.textFieldColor),
            ),
          ),

        )
      ],
    );
  }
}

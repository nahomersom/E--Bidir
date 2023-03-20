import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
class SharedTextField extends StatelessWidget {
  const SharedTextField({
    super.key,
    required TextTheme textTheme,
    required this.label,required this.placeholder, required this.prefixIcon, this.suffixIcon
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;
  final String label;
  final String placeholder;
  final Icon prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label,style: _textTheme.labelLarge,),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorResources.secondaryColor, width: 1.0
                  )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorResources.secondaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorResources.secondaryColor, width: 2.0),
              ),
            ),

          )
        ],
      ),
    );
  }
}

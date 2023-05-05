import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';

import '../../utils/color_resource.dart';
import '../../utils/size_config.dart';

class TabTextField extends StatelessWidget {
  TabTextField({
    super.key,
    required this.textEditingController,
    required TextTheme textTheme,
    required this.label,
    this.isFormSubmitted = false,
    this.value,
    this.onChange,
    this.isNumberField = false,
    this.isMoneyField = false,
    this.formKey,
    isReadonly = true,
  })  : _textTheme = textTheme,
        _isReadonly = isReadonly;

  final TextTheme _textTheme;
  final String label;
  dynamic value;
  dynamic formKey;
  bool isNumberField;
  bool isMoneyField;
  final void Function(String)? onChange;
  final bool isFormSubmitted;
  bool _isReadonly;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            label,
            style: _textTheme.labelLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.02,
        ),
        TextFormField(
          key: Key(formKey.toString()),
          onChanged: onChange,
          readOnly: _isReadonly,
          inputFormatters: isMoneyField ? [CurrencyInputFormatter()] : [],

          keyboardType:
              isNumberField ? TextInputType.number : TextInputType.text,
          // initialValue: 'Ikdjkajdkljfkdlj',
          //  controller: textEditingController..text = value != null ? value.toString():'',
          controller: textEditingController,
          // initialValue: value.toString() ?? textEditingController.text,
          decoration: InputDecoration(
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            errorText: isFormSubmitted && textEditingController.text.isEmpty
                ? 'This field is required'
                : null,
            fillColor: ColorResources.textFieldColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: ColorResources.textFieldColor,
            )),
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

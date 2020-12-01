import 'package:flutter/material.dart';
import 'package:itsuit/utils/constants.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxlines;

  const CustomField({
    Key key,
    @required this.label,
    @required this.hint,
    this.maxlines = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.bluedark, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: hint,
      ),
    );
  }
}

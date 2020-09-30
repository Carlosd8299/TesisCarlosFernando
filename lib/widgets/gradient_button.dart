import 'package:flutter/material.dart';

class GradienButtton extends StatelessWidget {
  final String text;
  final double width;
  final LinearGradient gradient;
  final Function onTap;

  const GradienButtton({
    Key key,
    @required this.text,
    @required this.width,
    @required this.gradient,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      child: Ink(
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: width,
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'linear_gradient.dart';

class CircleGradientButton extends StatelessWidget {
  final IconData icon;

  const CircleGradientButton({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: bluegradient(), borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}

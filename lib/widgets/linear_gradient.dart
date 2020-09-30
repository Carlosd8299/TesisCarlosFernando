import 'package:flutter/material.dart';

LinearGradient bluegradient() {
  return LinearGradient(
    colors: [
      Color(0xff374ABE),
      Color(0xff64B6FF),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

LinearGradient bluelightgradient() {
  return LinearGradient(
    colors: [
      Color.fromRGBO(143, 148, 251, 1),
      Color.fromRGBO(143, 148, 251, .6),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

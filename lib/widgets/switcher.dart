import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';

class Switcher extends StatelessWidget {
  final int token;
  final Widget proveedor;
  final Widget solicitante;

  Switcher(this.proveedor, this.solicitante, this.token);

  @override
  Widget build(BuildContext context) {
    if (this.token == 1) {
      return proveedor;
    } else if (this.token == 2) {
      return solicitante;
    } else {
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
        ),
      );
    }
  }
}

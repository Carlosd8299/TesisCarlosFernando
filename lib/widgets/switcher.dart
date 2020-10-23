import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final int tipoUsuario;
  final Widget proveedor;
  final Widget empresa;

  Switcher(this.proveedor, this.empresa, this.tipoUsuario);

  @override
  Widget build(BuildContext context) {
    if (this.tipoUsuario == 1) {
      return proveedor;
    } else if (this.tipoUsuario == 2) {
      return empresa;
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

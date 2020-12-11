import 'package:flutter/material.dart';

class SingleItemContraOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
            ]),
      child: Text("hola"),
    );
  }
}

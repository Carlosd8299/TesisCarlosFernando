import 'dart:convert';

import 'package:flutter/material.dart';

class SingleOferta extends StatelessWidget {
  final String nombreProveedor;
  final String srcImageProveedor;
  final String fechaSubidaOferta;

  const SingleOferta(
      {Key key,
      @required this.nombreProveedor,
      @required this.srcImageProveedor,
      @required this.fechaSubidaOferta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.memory(
            base64Decode(srcImageProveedor),
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombreProveedor,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(fechaSubidaOferta,
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

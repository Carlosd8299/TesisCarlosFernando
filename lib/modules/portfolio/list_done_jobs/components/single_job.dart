import 'package:flutter/material.dart';

class SingleDoneJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Nombre del trabajo realizado",
            style: TextStyle(
                color: Color(0xff144FBA),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Servicio",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              Text(
                "Nombre del Servicio",
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Categoria",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            Text(
              "Nombre de la categoria",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Tiempo de ejecucion",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            Text(
              "X meses",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Empresa",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            Text(
              "Nombre de la empresa",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ]),
        ],
      ),
    );
  }
}

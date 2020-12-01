import 'package:flutter/material.dart';

class SocialCounter extends StatelessWidget {
  final bool isEmpresa;
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;

  const SocialCounter({Key key, this.isEmpresa = false,@required this.firstTitle,@required this.secondTitle, @required this.thirdTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return !isEmpresa
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Participaciones",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      this.firstTitle.trim(),
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Ganadas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(this.secondTitle.trim(), style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Directas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(this.thirdTitle.trim(), style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            ),
          )
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Procesos de seleccion",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(this.firstTitle.trim(), style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Directas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(this.secondTitle.trim(), style: TextStyle(fontSize: 20))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Proveedores",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(this.thirdTitle.trim(), style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            ),
          );
  }
}

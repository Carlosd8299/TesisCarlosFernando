import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itsuit/utils/constants.dart';

final List<String> categorias = [
  "Redes",
  "Sistemas",
  "Si",
  "Audit",
  "Redes",
  "Sistemas",
  "Si",
  "Audit"
];

class CardRecomended extends StatelessWidget {
  final bool isProveedor;
  final String empresa;
  final String tituloCard;
  final List arrayCategorias;
  final String fecha;
  final String profileImage;

  const CardRecomended(
      {Key key,
      @required this.isProveedor,
      @required this.empresa,
      @required this.tituloCard,
      @required this.arrayCategorias,
      @required this.fecha,
      @required this.profileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Text(
                  this.empresa.trim(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 60,
              ),
              //const Spacer(),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: 70,
                height: 70,
                child: (profileImage == null)
                    ? Image.network(
                        "https://es.logodownload.org/wp-content/uploads/2018/10/coca-cola-logo-11-1024x335.png",
                        fit: BoxFit.contain,
                      )
                    : Image.memory(base64Decode(profileImage)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Text(
              this.tituloCard.trim(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          isProveedor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 340,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: this.arrayCategorias.length,
                      itemBuilder: (context, index) {
                        String categoria = this.arrayCategorias[index];
                        Color color = Constants.colorlist[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 6,
                                      offset: Offset(1, 3))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categoria.trim(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
              : Container(
                  height: 55,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: this.arrayCategorias.length,
                    itemBuilder: (context, index) {
                      String categoria = this.arrayCategorias[index];
                      Color color = Constants.colorlist[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 6,
                                    offset: Offset(1, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              categoria,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Text(this.fecha.trim()),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.bluecake,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
          ]),
    );
  }
}

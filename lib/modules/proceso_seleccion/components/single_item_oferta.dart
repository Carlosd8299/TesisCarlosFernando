import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';

class SingleItemOferta extends StatelessWidget {
  final bool isProveedor;
  final Oferta oferta;

  const SingleItemOferta(
      {Key key, @required this.isProveedor, @required this.oferta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Get.toNamed(AppRoutes.DETAILOFERTA,
            arguments: [this.oferta, (this.isProveedor) ? 1 : 2])
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(
              base64Decode(oferta.profileImage.trim()),
              height: 100,
              width: 200,
              fit: BoxFit.cover,
            ),
            Text(
              this.oferta.titulo,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Row(
              children: [
                Text(
                  'Estado de la oferta:',
                  style: TextStyle(
                      color: Constants.bluedark, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  this.oferta.nombreEstado,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Presupuesto ofertado:',
                  style: TextStyle(
                      color: Constants.bluedark, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  '\$' + this.oferta.valor.toString(),
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

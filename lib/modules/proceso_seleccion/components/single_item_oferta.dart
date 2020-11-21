import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_detail/detail_oferta_screen.dart';
import 'package:itsuit/utils/constants.dart';

class SingleItemOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailOfertaScreen()),
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
            Image.network(
              Constants.linkProviderAvatar,
              height: 100,
              width: 200,
              fit: BoxFit.cover,
            ),
            Text(
              "Nombre del proveedor",
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
                  'Contraoferta',
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
                  '\$10.000.000',
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

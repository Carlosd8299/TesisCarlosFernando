import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/routes/my_routes.dart';

class SingleCupon extends StatelessWidget {
  final Cupon cupon;
  final int tipoUser;

  const SingleCupon({
    Key key,
    @required this.cupon,
    @required this.tipoUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(AppRoutes.DETAILSCUPON, arguments: [cupon, tipoUser]),
      child: Container(
        padding: EdgeInsets.only(left: 10),
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
              cupon.porcentajeDescuento.toString() + " %",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              cupon.nombreServicio,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cupon.precioNormal.toString(),
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 12),
                ),
                SizedBox(width: 5),
                Text(
                  cupon.precioDescuento.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            Text(cupon.fechaFin.toString(), style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

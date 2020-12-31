import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';

import 'package:itsuit/routes/my_routes.dart';

class SingleSeleccionDirectaItem extends StatelessWidget {
  final ProcesoSeleccion datos;
  final int tipoUsuario;
  const SingleSeleccionDirectaItem(
      {Key key, @required this.datos, @required this.tipoUsuario})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.SELECCIONDIRECTADETAIL,
          arguments: [datos, this.tipoUsuario]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              datos.titulo.trim(),
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Row(children: [
              Text(
                "Estado: ",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(width: 3),
              Text(datos.nombreEstado.trim()),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Servicio asociado:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(datos.nombreServicio),
              ],
            ),
            Text(
              "Fecha de ejecución del servicio:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Text(datos.fechaSolicitud.toString()),
          ],
        ),
      ),
    );
  }
}

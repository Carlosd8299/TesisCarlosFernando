import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/routes/my_routes.dart';

class SingleItemProcesoSeleccion extends StatelessWidget {
  //Recibir proceso de seleecion
  final ProcesoSeleccion procesoSeleccion;
  final int tipoUsuario;

  const SingleItemProcesoSeleccion(
      {Key key, @required this.procesoSeleccion, @required this.tipoUsuario})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.DETAILPROCESO,
          arguments: [procesoSeleccion, tipoUsuario]),
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
              procesoSeleccion.titulo,
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
              Text(procesoSeleccion.nombreEstado),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Servicio asociado:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(procesoSeleccion.nombreServicio),
              ],
            ),
            Text(
              "Fecha de ejecución del servicio:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Text(procesoSeleccion.fechaSolicitud.toString()),
          ],
        ),
      ),
    );
  }
}

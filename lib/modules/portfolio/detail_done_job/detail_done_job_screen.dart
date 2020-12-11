import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/widgets/double_button_navigator.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

import 'detail_done_job_controller.dart';

class DetailsDoneJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsDoneJobController>(
      builder: (_) => Switcher(
          DetailsDoneJobProveedor(
            trabajo:
                _.getTrabajoRealizado != false ? _.getTrabajoRealizado : null,
          ),
          DetailsDoneJobEmpresa(
            trabajo:
                _.getTrabajoRealizado != false ? _.getTrabajoRealizado : null,
          ),
          2),
    );
  }
}

class DetailsDoneJobProveedor extends StatelessWidget {
  final TrabajoRealizado trabajo;

  const DetailsDoneJobProveedor({Key key, @required this.trabajo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<DetailsDoneJobController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => print(""),
              title: 'Titulo del trabajo realizado',
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleGradientButton(
                    icon: Icons.timer,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "12 meses",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 25),
                  CircleGradientButton(
                    icon: Icons.room_service,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Nombre del servicio",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descripción del trabajo realizado",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Descripción del trabajo realizaDescripción del trabajo realizadoDescripción del trabajo realizadoDescripción del trabajo realizadoDescripción del trabajo realizadoDescripción del trabajo realizadoDescripción del trabajo realizadodo",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Categoria del servicio",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Se muestra la categoria de servicio escogida",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Servicio brindado",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Se muestra la nombre de servicio brindado",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Empresa contatante",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Se muestra el nombre de la empresa quien contrato el servicio brindado",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Eliminar trabajo realizado",
            instruction: "Remover del portafolio",
            onTap: () => print("Hola"),
            icon: Icon(Icons.delete),
            color: Colors.black),
      ),
    );
  }
}

class DetailsDoneJobEmpresa extends StatelessWidget {
  final TrabajoRealizado trabajo;

  const DetailsDoneJobEmpresa({Key key, @required this.trabajo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsDoneJobController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            //AppBar
            CustomAppBar(onTap: () => Get.back(), title: trabajo.nombreTrabajo),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleGradientButton(
                    icon: Icons.timer,
                  ),
                  SizedBox(width: 5),
                  Text(
                    (trabajo.fechaInicio.year == trabajo.fechaFin.year)
                        ? 1
                        : (trabajo.fechaFin.year - trabajo.fechaInicio.year)
                                .toString() +
                            " año(s)",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 25),
                  CircleGradientButton(
                    icon: Icons.room_service,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Nombre del servicio",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descripción del trabajo realizado",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      trabajo.descripcion,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Categoria del servicio",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      trabajo.nombreCategoria,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Servicio brindado",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Se muestra la nombre de servicio brindado",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Empresa contatante",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      trabajo.empresa,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

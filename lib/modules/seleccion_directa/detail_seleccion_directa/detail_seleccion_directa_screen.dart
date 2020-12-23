import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/seleccion_directa/detail_seleccion_directa/detail_seleccion_directa_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

class SeleccionDirectaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (controller) => Switcher(SeleccionDIrectaDetailProveedor(),
          SeleccionDIrectaDetailempresa(), 1),
    );
  }
}

class SeleccionDIrectaDetailProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
              shadowColor: null,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back()),
            ),
            preferredSize: Size.fromHeight(50)),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Foto del perfil del proveedor

                    // LA COMENTE PARA QUE NO DIERA ERROR AL NO ESTAR ASOCIADA LA CLASE
                    /*  SafeArea(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:
                          MemoryImage(base64Decode(proceso.profileImage)),
                      radius: 80,
                    ),
                  ),
                ), */
                    //
                    SizedBox(height: 10),
                    //Titulo e introudccion de la oferta
                    Column(
                      children: [
                        Text(
                          " proceso.titulo",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                        Text("proceso.nombreTercero"),
                        Text("proceso.fechaSolicitud.toLocal().toString(),"),
                      ],
                    ),

                    SizedBox(height: 20),
                    //Descripcion de la oferta
                    Text(
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "directa.descripcion",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    //Presupuesto
                    Text(
                      "Presupuesto",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "proceso.presupuesto.toString()",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    //Empieza el calendario
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cronograma y calendario",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Fecha de inicio de ejecucion",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    )
                  ])),
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Contestar solicitud",
            instruction:
                "Rechaza, Acepta o contra oferta esta solicitud que se te ha hecho de manera directa",
            onTap: () => Get.toNamed(AppRoutes.CREATEOFERTA),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

class SeleccionDIrectaDetailempresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
              shadowColor: null,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back()),
            ),
            preferredSize: Size.fromHeight(50)),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Foto del perfil del proveedor

                    // LA COMENTE PARA QUE NO DIERA ERROR AL NO ESTAR ASOCIADA LA CLASE
                    /*  SafeArea(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:
                          MemoryImage(base64Decode(proceso.profileImage)),
                      radius: 80,
                    ),
                  ),
                ), */
                    //
                    SizedBox(height: 10),
                    //Titulo e introudccion de la oferta
                    Column(
                      children: [
                        Text(
                          " proceso.titulo",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                        Text("proceso.nombreTercero"),
                        Text("proceso.fechaSolicitud.toLocal().toString(),"),
                      ],
                    ),

                    SizedBox(height: 20),
                    //Descripcion de la oferta
                    Text(
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "directa.descripcion",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    //Presupuesto
                    Text(
                      "Presupuesto",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "proceso.presupuesto.toString()",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    //Empieza el calendario
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cronograma y calendario",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Fecha de inicio de ejecucion",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    )
                  ])),
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Contestar solicitud",
            instruction:
                "Rechaza, Acepta o contra oferta esta solicitud que se te ha hecho de manera directa",
            onTap: () => Get.toNamed(AppRoutes.CREATEOFERTA),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

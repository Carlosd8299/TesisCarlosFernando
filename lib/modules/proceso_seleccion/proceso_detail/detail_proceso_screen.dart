import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_oferta_proveedor.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

import '../../screens.dart';
import 'detail_proceso_controller.dart';

List lista = [
  SingleOferta(
    fechaSubidaOferta: "10-10-2020",
    nombreProveedor: 'Indra',
    srcImageProveedor:
        "https://pcs.usal.es/wp-content/uploads/2014/12/indralogo.png",
  ),
  SingleOferta(
    fechaSubidaOferta: "10-10-2020",
    nombreProveedor: 'Indra',
    srcImageProveedor:
        "https://pcs.usal.es/wp-content/uploads/2014/12/indralogo.png",
  ),
  SingleOferta(
    fechaSubidaOferta: "10-10-2020",
    nombreProveedor: 'Indra',
    srcImageProveedor:
        "https://pcs.usal.es/wp-content/uploads/2014/12/indralogo.png",
  ),
  SingleOferta(
    fechaSubidaOferta: "10-10-2020",
    nombreProveedor: 'Indra',
    srcImageProveedor:
        "https://pcs.usal.es/wp-content/uploads/2014/12/indralogo.png",
  ),
];

class DetailProcesoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProcesoController>(
      builder: (_) => Switcher(
          DetailProcesoScreenProveedor(
            proceso: _.getProceso,
          ),
          DetailProcesoScreenEmpresa(
            proceso: _.getProceso,
          ),
          _.getTipoUsuario),
    );
  }
}

class DetailProcesoScreenProveedor extends StatelessWidget {
  final ProcesoSeleccion proceso;

  const DetailProcesoScreenProveedor({Key key, @required this.proceso})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProcesoController>(
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
                SafeArea(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        Constants.linkProviderAvatar,
                      ),
                      radius: 80,
                    ),
                  ),
                ),
                //
                SizedBox(height: 10),
                //Titulo e introudccion de la oferta
                Column(
                  children: [
                    Text(
                      proceso.titulo,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Text(proceso.nombreTercero),
                    Text(
                      proceso.fechaSolicitud.toLocal().toString(),
                    ),
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
                  proceso.descripcion,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                //Terminos y condiciones
                Text(
                  "Condiciones y criterios",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 10),
                Text(
                  proceso.criterio,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                //Presupuesto
                Text(
                  "Presupuesto",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 10),
                Text(
                  proceso.presupuesto.toString(),
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
                    //Items del calendario
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de inicio de recepción de oferta:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaSolicitud.toString(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de fin de recepción de oferta",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(proceso.fechaFin.toString()),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de inicio de selección:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaSeleccion.toString(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de fin de selección:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaFinSeleccion.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //Inicio de los proveedores que han aplicado
                Text(
                  "Proveedores que han Aplicado",
                  style: Theme.of(context).textTheme.headline1,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Aplicar",
            instruction:
                "Empezar a participar en la puja, ofrecer alternativas, ofrecer un alcance, presupuesto y tiempos distintos",
            onTap: () => Get.to(CreateOfertaScreen()),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

class DetailProcesoScreenEmpresa extends StatelessWidget {
  final ProcesoSeleccion proceso;

  const DetailProcesoScreenEmpresa({Key key, @required this.proceso})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProcesoController>(
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
                SafeArea(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        Constants.linkProviderAvatar,
                      ),
                      radius: 80,
                    ),
                  ),
                ),
                //
                SizedBox(height: 10),
                //Titulo e introudccion de la oferta
                Column(
                  children: [
                    Text(
                      proceso.titulo,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Text(proceso.nombreTercero),
                    Text(
                      proceso.fechaSolicitud.toLocal().toString(),
                    ),
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
                  proceso.descripcion,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                //Terminos y condiciones
                Text(
                  "Condiciones y criterios",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 10),
                Text(
                  proceso.criterio,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                //Presupuesto
                Text(
                  "Presupuesto",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 10),
                Text(
                  proceso.presupuesto.toString(),
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
                    //Items del calendario
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de inicio de recepción de oferta:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaSolicitud.toString(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de fin de recepción de oferta",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(proceso.fechaFin.toString()),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de inicio de selección:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaSeleccion.toString(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de fin de selección:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          proceso.fechaFinSeleccion.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //Inicio de los proveedores que han aplicado
                Text(
                  "Proveedores que han Aplicado",
                  style: Theme.of(context).textTheme.headline1,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                    SingleOferta(
                      fechaSubidaOferta: "10-10-2020",
                      nombreProveedor: 'Indra',
                      srcImageProveedor:
                          "https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Ver ofertas",
            instruction:
                "Revisa las ofertas realizadas por los proveedores en este proceso de seleccion",
            onTap: () => Get.to(ListOfertaScreen()),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

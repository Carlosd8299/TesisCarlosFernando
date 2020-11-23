import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          DetailProcesoScreenProveedor(), DetailProcesoScreenEmpresa(), 1),
    );
  }
}

class DetailProcesoScreenProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProcesoController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                //Titulo e introudccion de la oferta
                Column(
                  children: [
                    Text(
                      " Montaje de red en recursos humanos",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Nombre de la empresa",
                    ),
                    Text(
                      "Inicia" + "Fecha en la que inicia",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
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
                          "10-10-2020",
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
                        Text(
                          "10-10-2020",
                        ),
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
                          "10-10-2020",
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
                          "10-10-2020",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dias maximos para recibir contraoferta:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "3",
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProcesoController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                //Titulo e introudccion de la oferta
                Column(
                  children: [
                    Text(
                      " Montaje de red en recursos humanos",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Nombre de la empresa",
                    ),
                    Text(
                      "Inicia" + "Fecha en la que inicia",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
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
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
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
                          "10-10-2020",
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
                        Text(
                          "10-10-2020",
                        ),
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
                          "10-10-2020",
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
                          "10-10-2020",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dias maximos para recibir contraoferta:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "3",
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/colored_button.dart';
import 'package:itsuit/modules/seleccion_directa/detail_seleccion_directa/detail_seleccion_directa_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

class SeleccionDirectaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (controller) => Switcher(SeleccionDIrectaDetailProveedor(),
          SeleccionDIrectaDetailempresa(), controller.getTipoUsuario),
    );
  }
}

class SeleccionDIrectaDetailProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(title: _.proceso.titulo, onTap: () => Get.back()),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                    function: () =>
                        {_.getbotnActivado ? _.aprobarSolicitud() : ({})},
                    color: Constants.greenflatbutton,
                    label: 'Aceptar',
                    icon: (FontAwesomeIcons.check),
                    estado: _.getbotnActivado,
                  ),
                  RoundedIconButton(
                    function: () =>
                        {_.getbotnActivado ? _.rechazarSolicitud() : ({})},
                    color: Constants.redflatbutton,
                    label: 'Rechazar',
                    icon: (FontAwesomeIcons.times),
                    estado: _.getbotnActivado,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SafeArea(
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: MemoryImage(
                                    base64Decode(_.proceso.profileImage)),
                                radius: 80,
                              ),
                            ),
                          ),
                        ]))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            //Titulo e introudccion de la oferta
            SliverToBoxAdapter(
                child: Column(
              children: [
                Text(
                  _.proceso.titulo,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text(_.proceso.nombreTercero),
                Text(_.proceso.fechaSolicitud.toLocal().toString()),
              ],
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),

            //Descripcion de la oferta
            SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Descripción de la oferta",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            _.proceso.descripcion,
                            textAlign: TextAlign.justify,
                          )
                        ]))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),

            SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Presupuesto
                          Text(
                            "Presupuesto",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            _.proceso.presupuesto.toString(),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 20),
                        ]))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),

            //Empieza el calendario
            SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
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
                        Text(
                          _.proceso.fechaSolicitud.toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class SeleccionDIrectaDetailempresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSeleccionDirectaController>(
      builder: (_) => Scaffold(
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
                      SafeArea(
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: MemoryImage(
                                base64Decode(_.proceso.profileImage)),
                            radius: 80,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //Titulo e introudccion de la oferta
                      Column(
                        children: [
                          Text(
                            _.proceso.titulo,
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                          Text(_.proceso.nombreTercero),
                          Text(_.proceso.fechaSolicitud.toLocal().toString()),
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
                        _.proceso.descripcion,
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
                        _.proceso.presupuesto.toString(),
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
                          Text(
                            _.proceso.fechaSolicitud.toString(),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      )
                    ])),
          )),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/own_profile/components/card_button_profile.dart';
import 'package:itsuit/modules/own_profile/components/social_counter.dart';
import 'package:itsuit/modules/own_profile/own_profile_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

class OwnProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnProfileController>(
      builder: (_) => Switcher(OwnProfileProveedor(), OwnProfileEmpresa(),
          _.r.usuario.idTipoUsuario),
    );
  }
}

class OwnProfileProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnProfileController>(
      builder: (_) => Scaffold(
        backgroundColor: Constants.bluelight,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Foto de perfil
              SafeArea(
                child: CircleAvatar(
                  backgroundImage:
                      MemoryImage(base64Decode(_.r.usuario.profileImage)),
                  radius: 80,
                ),
              ),
              SizedBox(height: 20),
              //Comienza el contenedor blanco
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Aqui comienza la informacion social del proveedor
                    GetBuilder<OwnProfileController>(
                        id: "cabeceraProveedor",
                        builder: (_) {
                          return SocialCounter(
                              isEmpresa: false,
                              firstTitle:
                                  _.getProveedor.cantidadParticipa.toString(),
                              secondTitle:
                                  _.getProveedor.cantidadAprobada.toString(),
                              thirdTitle:
                                  _.getProveedor.cantidadDirecta.toString());
                        }),
                    //Aqui comienza el menu de botones
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[0],
                                  label: "Mi cuponera",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTCUPON,
                                        arguments: [_.r, _.getProveedor]);
                                  },
                                  icon: Icons.receipt),
                              CardButtonProfile(
                                  color: Constants.colorlist[1],
                                  label: "Mis procesos de seleccion",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTPROCESO,
                                        arguments: _.r);
                                  },
                                  icon: Icons.low_priority)
                            ],
                          ),
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[2],
                                  label: "Mi Portafolio",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTDONEJOB,
                                        arguments: [_.getProveedor, 1]);
                                  },
                                  icon: Icons.card_travel),
                              CardButtonProfile(
                                  color: Constants.colorlist[3],
                                  label: "Historico de ItSuit",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTHISTORICO,
                                        arguments: _.getProveedor);
                                  },
                                  icon: Icons.history)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //Boton bottom perfil
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Completar mi perfil",
            instruction:
                "Información de la compañía | Rellenar Portafolio | Asignación de categorias",
            onTap: () => print("Hola"),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

class OwnProfileEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnProfileController>(
      builder: (_) => Scaffold(
        backgroundColor: Constants.bluelight,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Foto de perfil
              SafeArea(
                child: CircleAvatar(
                  backgroundImage:
                      MemoryImage(base64Decode(_.r.usuario.profileImage)),
                  radius: 80,
                ),
              ),
              SizedBox(height: 20),
              //Comienza el contenedor blanco
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<OwnProfileController>(
                        id: "cabeceraSolcitante",
                        builder: (_) {
                          return SocialCounter(
                              isEmpresa: true,
                              firstTitle:
                                  _.getSolicitante.cantidadSeleccion.toString(),
                              secondTitle:
                                  _.getSolicitante.cantidadDirectas.toString(),
                              thirdTitle: _.getSolicitante.cantidadProveedor
                                  .toString());
                        }),
                    //Aqui comienza el menu de botones
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[0],
                                  label: "Mis procesos de seleccion",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTPROCESO,
                                        arguments: _.r);
                                  },
                                  icon: Icons.low_priority),
                              CardButtonProfile(
                                  color: Constants.colorlist[2],
                                  label: "Solicitudes directas",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.LISTOFERTAS,
                                        arguments: _.r);
                                  },
                                  icon: Icons.send),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //Boton bottom perfil
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Abrir un proceso de seleccion",
            instruction:
                "Solicitar servicio del proveedor dependiendo de los servicios que ofree",
            onTap: () => {Get.toNamed(AppRoutes.CREATEPROCESO, arguments: _.r)},
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

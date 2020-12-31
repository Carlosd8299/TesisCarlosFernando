import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

Future<void> _showSelectionDialog(
    BuildContext context, OwnProfileController _) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("¿De donde desea tomar la foto?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galeria"),
                    onTap: () {
                      _openImage(context, _, 2);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camara"),
                    onTap: () {
                      _openImage(context, _, 1);
                    },
                  )
                ],
              ),
            ));
      });
}

void _openImage(
    BuildContext context, OwnProfileController _, int pSource) async {
  var picture = await ImagePicker().getImage(
      source: (pSource == 1) ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 80,
      maxHeight: 80,
      imageQuality: 85);
  if (picture != null) {
    _.changedProfileImage(picture);
  }
  Navigator.of(context).pop();
}

class OwnProfileProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnProfileController>(
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50),
          child: AppBar(
            elevation: 0,
            actions: [
              Container(
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.home,
                      color: Colors.black,
                    ),
                    onPressed: () =>
                        Get.toNamed(AppRoutes.HOME, arguments: _.getR)),
              )
            ],
          ),
        ),
        backgroundColor: Constants.bluelight,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<OwnProfileController>(
                  id: 'profile',
                  builder: (_) => GestureDetector(
                        child: //Foto de perfil
                            CircleAvatar(
                          backgroundImage:
                              MemoryImage(base64Decode(_.getProfileImage)),
                          radius: 80,
                        ),
                        onTap: () {
                          _showSelectionDialog(context, _);
                        },
                      )),

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
                child: SingleChildScrollView(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                icon: Icons.history),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardButtonProfile(
                                color: Constants.colorlist[2],
                                label: "Solicitudes directas",
                                onTap: () {
                                  Get.toNamed(AppRoutes.SELECCIONDIRECTALIST);
                                },
                                icon: Icons.send),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
        //Boton bottom perfil
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Completar mi perfil",
            instruction:
                "Información de la compañía | Rellenar Portafolio | Asignación de categorias",
            onTap: () => Get.toNamed(AppRoutes.ADDCATEGORIAPROVEEDOR),
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
        appBar: PreferredSize(
          preferredSize: Size(0, 50),
          child: AppBar(
            elevation: 0,
            actions: [
              Container(
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.home,
                      color: Colors.black,
                    ),
                    onPressed: () =>
                        Get.toNamed(AppRoutes.HOME, arguments: _.getR)),
              )
            ],
          ),
        ),
        backgroundColor: Constants.bluelight,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Foto de perfil
              SafeArea(
                child: GetBuilder<OwnProfileController>(
                    id: 'profile',
                    builder: (_) => GestureDetector(
                          child: //Foto de perfil
                              CircleAvatar(
                            backgroundImage:
                                MemoryImage(base64Decode(_.getProfileImage)),
                            radius: 80,
                          ),
                          onTap: () {
                            _showSelectionDialog(context, _);
                          },
                        )),
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
                  children: [
                    SizedBox(height: 20),
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
                    SizedBox(height: 10),
                    //Aqui comienza el menu de botones
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardButtonProfile(
                                color: Constants.colorlist[0],
                                label: "Mis procesos de seleccion",
                                onTap: () {
                                  Get.toNamed(AppRoutes.LISTPROCESO,
                                      arguments: [_.r, null]);
                                },
                                icon: Icons.low_priority),
                            CardButtonProfile(
                                color: Constants.colorlist[2],
                                label: "Solicitudes directas",
                                onTap: () {
                                  Get.toNamed(AppRoutes.SELECCIONDIRECTALIST);
                                },
                                icon: Icons.send),
                          ],
                        )
                      ],
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

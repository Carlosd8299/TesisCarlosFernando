import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/modules/home/home_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Switcher(
            HomeProveedor(
              usuario: _.r.usuario,
            ),
            HomeEmpresa(
              usuario: _.r.usuario,
            ),
            _.r.usuario.idTipoUsuario));
  }
}

class HomeProveedor extends StatelessWidget {
  final Usuario usuario;

  const HomeProveedor({Key key, @required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scafolKey = GlobalKey();
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              CircleAvatar(
                radius: 70,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: MemoryImage(
                      base64Decode(this.usuario.profileImage.trim())),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                this.usuario.nombre,
                style: Theme.of(context).textTheme.headline1,
              )),
              ListTile(
                leading: Icon(Icons.portrait, color: Constants.bluedark),
                title: Text('Ir al perfil',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                onTap: () {
                  Get.toNamed(AppRoutes.OWNPROFILE, arguments: _.r);
                },
              ),
              FlatButton(
                onPressed: () => _.logOut(),
                child: Text("Cerrar Sesion"),
                color: Colors.red,
              )
            ],
          ),
        ),
        key: _scafolKey,
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
              shadowColor: null,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _scafolKey.currentState.openDrawer()),
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Encuentra ofertas y aplica para conseguir la licitacion",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(
                  hint: "Digite el tipo de servicio que desea buscar",
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Licitaciones recomendadas",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 500,
                    height: 220,
                    child: GetBuilder<HomeController>(
                        id: 'recommendedSolicitud',
                        builder: (_) {
                          return ListView.builder(
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  null == _.getListSolicitudesRecomendadas
                                      ? 0
                                      : _.getListSolicitudesRecomendadas.length,
                              itemBuilder: (context, index) {
                                final ProcesoSeleccion data =
                                    _.getListSolicitudesRecomendadas[index];
                                return GestureDetector(
                                  child: CardRecomended(
                                    isProveedor: true,
                                    empresa: data.nombreTercero,
                                    tituloCard: data.titulo,
                                    fecha: "Fecha de la solicitud: " +
                                        (new DateFormat("yyyy-MM-dd")
                                                .format(data.fechaSolicitud))
                                            .toString(),
                                    arrayCategorias: [data.nombreServicio],
                                    profileImage: data.profileImage,
                                  ),
                                  onTap: () => Get.toNamed(
                                      AppRoutes.DETAILPROCESO,
                                      arguments: [data, _.getIdTipo]),
                                );
                              });
                        })),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Solicitudes abiertas",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 500,
                    height: 150,
                    child: GetBuilder<HomeController>(
                        id: 'SolicitudCategorias',
                        builder: (_) {
                          return ListView.builder(
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              itemCount: null ==
                                      _.getListCantSolicitudesCategoria
                                  ? 0
                                  : _.getListCantSolicitudesCategoria.length,
                              itemBuilder: (context, index) {
                                return SmallCard(
                                    title: _
                                        .getListCantSolicitudesCategoria[index]
                                        .categoria,
                                    subtitle:
                                        _.getListCantSolicitudesCategoria[index]
                                                .cantidad
                                                .toString() +
                                            " solicitudes",
                                    color: Constants.colorlist[28]);
                              });
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeEmpresa extends StatelessWidget {
  final Usuario usuario;

  const HomeEmpresa({Key key, @required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scafolKey = GlobalKey();
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: MemoryImage(
                      base64Decode(this.usuario.profileImage.trim())),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                this.usuario.nombre,
                style: Theme.of(context).textTheme.headline1,
              )),
              ListTile(
                leading: Icon(Icons.portrait, color: Constants.bluedark),
                title: Text('Ir al perfil',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                onTap: () {
                  Get.toNamed(AppRoutes.OWNPROFILE, arguments: _.r);
                },
              ),
              FlatButton(
                onPressed: () => _.logOut(),
                child: Text("Cerrar Sesion"),
                color: Colors.red,
              )
            ],
          ),
        ),
        key: _scafolKey,
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
              shadowColor: null,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _scafolKey.currentState.openDrawer()),
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Encuentra proveedores de servicios de TI",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(
                  hint: "Digite el tipo de servicio que desea buscar",
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Proveedores mejor calificados",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    width: 500,
                    child: GetBuilder<HomeController>(
                        id: 'recommendedProveedor',
                        builder: (_) {
                          return ListView.builder(
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              itemCount: null == _.getListProveedores
                                  ? 0
                                  : _.getListProveedores.length,
                              itemBuilder: (context, index) {
                                final Proveedor data =
                                    _.getListProveedores[index];

                                return GestureDetector(
                                  child: CardRecomended(
                                    isProveedor: false,
                                    empresa: data.nombreProveedor,
                                    tituloCard: '',
                                    fecha: "Fecha de registro : " +
                                        data.fechaRegistro,
                                    arrayCategorias: data.categorias,
                                    profileImage: data.profileImage,
                                  ),
                                  onTap: () => Get.toNamed(AppRoutes.PROFILE,
                                      arguments: [data, _.getIdTipo]),
                                );
                              });
                        })),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Proveedores por categorias",
                  style: (Theme.of(context).textTheme.headline1),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  height: 150,
                  child: GetBuilder<HomeController>(
                      id: 'ProveedorCategorias',
                      builder: (_) {
                        return ListView.builder(
                            controller: ScrollController(),
                            scrollDirection: Axis.horizontal,
                            itemCount: null == _.getProveedorCategorias
                                ? 0
                                : _.getProveedorCategorias.length,
                            itemBuilder: (context, index) {
                              return SmallCard(
                                  title:
                                      _.getProveedorCategorias[index].categoria,
                                  subtitle: _.getProveedorCategorias[index]
                                          .cantidad
                                          .toString() +
                                      " proveedores",
                                  color: Constants.colorlist[index]);
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

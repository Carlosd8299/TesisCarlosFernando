import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/modules/seleccion_directa/components/seleccion_directa_item.dart';
import 'package:itsuit/widgets/widgets.dart';
import 'list_seleccion_directa_controller.dart';

class ListSeleccionDirectaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListSeleccionDirectaController>(
      builder: (_) => Switcher(
          ListSeleccionDirectaProveedor(), ListSeleccionDirectaEmpresa(), 2),
    );
  }
}

class ListSeleccionDirectaProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListSeleccionDirectaController>(
        builder: (_) => Scaffold(
              body: CustomScrollView(slivers: [
                //AppBar
                CustomAppBar(
                  onTap: () => Get.back(),
                  title: 'Solicitudes directas de ItSuit',
                ),
                // Lista de selecciones directas
                SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: GetBuilder<ListSeleccionDirectaController>(
                        id: 'listSeleccionDirecta',
                        builder: (_) {
                          return SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              ProcesoSeleccion ps =
                                  _.getListProcesosSeleccion[index];
                              return SingleSeleccionDirectaItem(
                                  datos: ps, tipoUsuario: _.tipoUsuario);
                            }, childCount: _.getListProcesosSeleccion.length),
                          );
                        }))
              ]),
            ));
  }
}

class ListSeleccionDirectaEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListSeleccionDirectaController>(
        builder: (_) => Scaffold(
              body: CustomScrollView(slivers: [
                //AppBar
                CustomAppBar(
                  onTap: () => Get.back(),
                  title: 'Solicitudes directas',
                ),
                // Lista de selecciones directas
                SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: GetBuilder<ListSeleccionDirectaController>(
                        id: 'listSeleccionDirecta',
                        builder: (_) {
                          return SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              ProcesoSeleccion ps =
                                  _.getListProcesosSeleccion[index];
                              return SingleSeleccionDirectaItem(
                                  datos: ps, tipoUsuario: _.tipoUsuario);
                            }, childCount: _.getListProcesosSeleccion.length),
                          );
                        }))
              ]),
            ));
  }
}

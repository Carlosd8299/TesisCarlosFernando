import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_oferta.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_procesoSeleccion.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';

class ProcesoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProcesoListController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'Proceso de seleccion', onTap: () => Get.back()),
            SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: GetBuilder<ProcesoListController>(
                    id: 'listaSolicitudes',
                    builder: (_) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          ProcesoSeleccion data =
                              _.getListProcesosSeleccion[index];
                          return SingleItemProcesoSeleccion(
                            tipoUsuario: _.r.usuario.idTipoUsuario,
                            procesoSeleccion: data,
                          );
                        }, childCount: _.getListProcesosSeleccion.length),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

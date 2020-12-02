import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Solicitudes.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_oferta.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_detail/detail_oferta_screen.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_controller.dart';
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
                          Solicitud solicidtud = _.getListSolicitudes[index];
                          return SingleItemOferta(
                            isProveedor: false,
                            titulo: solicidtud.titulo,
                            estado: solicidtud.nombreEstado,
                            presupuesto: solicidtud.presupuesto,
                            solicitud: solicidtud,
                          );
                        }, childCount: _.getListSolicitudes.length),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

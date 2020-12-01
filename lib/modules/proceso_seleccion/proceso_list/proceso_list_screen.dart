import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_oferta.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_controller.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';


class ProcesoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProcesoListController>(
      builder: (_) =>
          Scaffold(
            body: CustomScrollView(
                slivers: [
                CustomAppBar(
                title: 'Proceso de seleccion',
              onTap: () => print("Entra")),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: GetBuilder<ProcesoListController>(
                id: 'listaSolicitudes',
                  builder: (_) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var data = _.getListSolicitudes[index];
                    return SingleItemOferta(isProveedor: false, titulo: data.titulo,estado: data.nombreEstado,presupuesto: data.presupuesto);
                  }, childCount: _.getListSolicitudes.length),
                );
              })
            )],
            ),
          ),
    );
  }
}

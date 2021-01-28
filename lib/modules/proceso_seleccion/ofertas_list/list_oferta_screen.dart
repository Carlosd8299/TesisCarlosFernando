import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_oferta.dart';
import 'package:itsuit/modules/proceso_seleccion/ofertas_list/list_oferta_controller.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';

class ListOfertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'Ofertas ' + controller.getProceso.titulo,
                onTap: () => Get.back()),
            SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: GetBuilder<ListOfertaController>(
                    id: 'listOfertas',
                    builder: (controller) => SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            Oferta oferta = controller.getlistOfertas[index];
                            return SingleItemOferta(
                              isProveedor: controller.isProveedor,
                              oferta: oferta,
                            );
                          }, childCount: controller.getlistOfertas.length),
                        )))
          ],
        ),
      ),
    );
  }
}

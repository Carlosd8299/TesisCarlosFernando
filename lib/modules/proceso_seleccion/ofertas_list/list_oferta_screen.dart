import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/single_item_oferta.dart';
import 'package:itsuit/modules/proceso_seleccion/ofertas_list/list_oferta_controller.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import '../proceso_detail/detail_proceso_screen.dart';

class ListOfertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'Ofertas + Nombre dle proceso de seleccion',
                onTap: () => Get.to(DetailProcesoScreenEmpresa())),
            SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return SingleItemOferta(
                      presupuesto: 0,
                      estado: "",
                      isProveedor: false,
                      titulo: "",
                    );
                  }, childCount: 10),
                ))
          ],
        ),
      ),
    );
  }
}

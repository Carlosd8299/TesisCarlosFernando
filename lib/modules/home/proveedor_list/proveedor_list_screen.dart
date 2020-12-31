import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/modules/home/proveedor_list/proveedor_list_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/widgets/widgets.dart';

class ProveedorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProveedorListController>(builder: (_) => ProveedorList());
  }
}

class ProveedorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProveedorListController>(
        builder: (_) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  CustomAppBar(
                      title: 'Lista de proveedores', onTap: () => Get.back()),
                  SliverPadding(
                      padding: EdgeInsets.all(20),
                      sliver: GetBuilder<ProveedorListController>(
                          id: 'listProveedor',
                          builder: (_) {
                            return SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                Proveedor data = _.getListProveedores[index];
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
                                      arguments: [data, 2]),
                                );
                              }, childCount: _.getListProveedores.length),
                            );
                          }))
                ],
              ),
            ));
  }
}

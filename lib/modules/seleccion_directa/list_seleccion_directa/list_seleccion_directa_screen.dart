import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_create/create_proceso_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';
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
                  title: 'Cupones',
                ),
                // Lista de copones
                SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: GetBuilder<ListSeleccionDirectaController>(
                    id: 'listacupones',
                    builder: (controller) => SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {},
                      ),
                    ),
                  ),
                )
              ]),
              bottomNavigationBar: ButtomBottomNav(
                  titleButton: "Crear cupon",
                  instruction:
                      "Crea cupones para que tus clientes obtengan descuentos cuando te seleccionen de manera directa como proveedor",
                  onTap: () => Get.toNamed(AppRoutes.CREATECUPON),
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black),
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
            title: 'Cupones',
          ),
          // Lista de copones
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: GetBuilder<ListSeleccionDirectaController>(
              id: 'listacupones',
              builder: (controller) => SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {}),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

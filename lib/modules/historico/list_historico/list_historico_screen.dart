import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';
import 'components/single_job.dart';
import 'list_historico_controller.dart';

class ListHistoricoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListHistoricoController>(
        builder: (_) =>
            Switcher(ListHistoricoProveedor(), ListHistoricoEmpresa(), 2));
  }
}

class ListHistoricoProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListHistoricoController>(
        builder: (controller) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  //AppBar
                  CustomAppBar(
                    onTap: () => Get.back(),
                    title: 'Mi Historial',
                  ),
                  // Lista de copones
                  SliverPadding(
                      padding: EdgeInsets.all(20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return SingleDoneJob();
                        }, childCount: 10),
                      ))
                ],
              ),
              bottomNavigationBar: ButtomBottomNav(
                  titleButton: "Añadir trabajo realizado",
                  instruction:
                      "Añade trabajos realizados por fuera de la plataforma para que las empresas vean tu experiencia",
                  onTap: () => print("Hola"),
                  icon: Icon(Icons.add),
                  color: Colors.black),
            ));
  }
}

class ListHistoricoEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListHistoricoController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => Get.back(),
              title: 'Historial',
            ),
            // Lista de copones
            SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: GetBuilder<ListHistoricoController>(
                    id: 'listPortafolio',
                    builder: (_) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final TrabajoRealizado trabajo =
                              _.getPortafolio[index];
                          return SingleDoneJob(trabajo: trabajo);
                        }, childCount: _.getPortafolio.length),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

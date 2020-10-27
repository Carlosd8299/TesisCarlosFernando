import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/portfolio/list_done_jobs/list_done_jobs_controller.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';
import 'components/single_job.dart';

class ListDoneJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDoneJobController>(
      builder: (_) => Switcher(ListDoneJobProveedor(), ListDoneJobEmpresa(), 1),
    );
  }
}

class ListDoneJobProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDoneJobController>(
        builder: (controller) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  //AppBar
                  CustomAppBar(
                    onTap: () => print(""),
                    title: 'Cupones',
                  ),
                  // Lista de copones
                  SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return SingleDoneJob();
                        },
                        childCount: 10,
                      ),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: ButtomBottomNav(
                  titleButton: "Crear cupon",
                  instruction:
                      "Crea cupones para que tus clientes obtengan descuentos cuando te seleccionen de manera directa como proveedor",
                  onTap: () => print("Hola"),
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black),
            ));
  }
}

class ListDoneJobEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDoneJobController>(
      builder: (controller) => Scaffold(),
    );
  }
}

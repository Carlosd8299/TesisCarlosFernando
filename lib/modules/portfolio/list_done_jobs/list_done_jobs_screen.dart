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
      builder: (_) => Switcher(ListDoneJobProveedor(), ListDoneJobEmpresa(), 2),
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
                    title: 'Mi Portafolio',
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

class ListDoneJobEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDoneJobController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => print(""),
              title: 'Mi Portafolio',
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
      ),
    );
  }
}

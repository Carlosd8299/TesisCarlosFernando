import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_controller.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

import 'components/single_cupon.dart';

class ListCuponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListCuponController>(
      builder: (_) => Switcher(ListCuponProveedor(), ListCuponEmpresa(), 1),
    );
  }
}

class ListCuponProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListCuponController>(
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
                          return SingleCupon();
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

class ListCuponEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListCuponController>(
      builder: (controller) => Scaffold(),
    );
  }
}

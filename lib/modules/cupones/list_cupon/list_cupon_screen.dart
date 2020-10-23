import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_controller.dart';
import 'package:itsuit/widgets/switcher.dart';

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
      builder: (controller) => Scaffold(),
    );
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

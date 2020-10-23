import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_controller.dart';
import 'package:itsuit/widgets/switcher.dart';

class DetailsCuponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (_) =>
          Switcher(DetailsCuponProveedor(), DetailsCuponEmpresa(), 1),
    );
  }
}

class DetailsCuponProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (controller) => Scaffold(),
    );
  }
}

class DetailsCuponEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (controller) => Scaffold(),
    );
  }
}

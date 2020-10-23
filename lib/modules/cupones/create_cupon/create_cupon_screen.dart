import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_controller.dart';
import 'package:itsuit/widgets/switcher.dart';

class CreateCuponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCuponController>(
      builder: (_) =>
          Switcher(CreateCuponProveedor(), CreateCuponProveedor(), 1),
    );
  }
}

class CreateCuponProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

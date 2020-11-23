import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_create/create_contra_oferta_controller.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import '../../screens.dart';

class CreateContraOfertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateContraOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'ContraOfertar',
                onTap: () => Get.to(DetailOfertaScreen()))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_create/create_oferta_controller.dart';

class CreateOfertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOfertaController>(
        builder: (controller) => Scaffold(
              body: CustomScrollView(
                slivers: [],
              ),
            ));
  }
}

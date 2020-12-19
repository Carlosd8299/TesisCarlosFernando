import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:itsuit/widgets/button_navigator.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';

import 'add_categories_proveedor_controller.dart';

class AddCategoriasProveedorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCategoriesController>(
        builder: (_) => GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    CustomAppBar(
                        title: "Añadir categorias de servicio",
                        onTap: () => Get.back()),
                    // Campo de texto para el titulo del cupon
                  ],
                ),
                bottomNavigationBar: ButtomBottomNav(
                    titleButton: "Crear cupón ",
                    instruction:
                        "Crea cupónes para que tus clientes obtengan descuentos cuando te seleccionen de manera directa como proveedor",
                    onTap: () => _.onCategoriaSubmited(),
                    icon: Icon(Icons.add),
                    color: Colors.black),
              ),
            ));
  }
}

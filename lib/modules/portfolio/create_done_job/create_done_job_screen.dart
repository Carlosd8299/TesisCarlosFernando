import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/button_navigator.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import 'create_done_job_controller.dart';

class CreateDoneJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDoneJobController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: "Añadir trabajo realizado",
                onTap: () {
                  Get.back();
                }),
            // Campo de texto del titulo de trabajo realizado
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.bluedark, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: 'Nombre del trabajo realizado',
                    ),
                  ),
                )),
            // Campo de texto de la descripcion de trabajo realizado
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    maxLines: 4,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.bluedark, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: 'Breve descripción del trabajo realizado',
                    ),
                  ),
                )),
            //Campo de texto de Nombre de la empresa contratante
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.bluedark, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: 'Nombre de la empresa contratante ',
                    ),
                  ),
                )),
            //Campo de texto de Tiempo de ejecucion del trabajo
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.timer, color: Constants.bluelight),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.bluedark, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: 'Tiempo de ejecucion (En meses)',
                    ),
                  ),
                )),
            // Dropdown para Servicio asociado
            SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              ),
              child: GetBuilder<CreateDoneJobController>(
                id: 'servicios',
                builder: (controller) => DropdownButton(
                  autofocus: true,
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  items: _.getServicios.map((Servicio value) {
                    return new DropdownMenuItem(
                      value: value.id,
                      child: new Text(value.nombre),
                    );
                  }).toList(),
                  onChanged: (value) => _.onServicioChanged(value),
                  hint: Text("Servicio asociado"),
                  value: _.getSelectedServicio,
                ),
              ),
            )),
            // Dropdown para Categoria de servicio
            SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              ),
              child: GetBuilder<CreateDoneJobController>(
                id: 'categorias',
                builder: (controller) => DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  items: _.getCategorias.map((Categoria value) {
                    return new DropdownMenuItem(
                      value: value.id,
                      child: new Text(value.nombre),
                    );
                  }).toList(),
                  value: _.getSelectedCategoria,
                  onChanged: (value) => _.onCategoriaChanged(value),
                  hint: Text("Categoria de servicio"),
                ),
              ),
            )),
            /* // Dropdown para escoger la categoria
            SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              ),
              child: GetBuilder<CreateDoneJobController>(
                builder: (controller) => DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  items: _.getServicios.map((Servicio value) {
                    return new DropdownMenuItem(
                      value: value.id,
                      child: new Text(value.nombre),
                    );
                  }).toList(),
                  value: _.getSelectedCategoria,
                  onChanged: (value) => _.onCategoriaChanged(value),
                  hint: Text("Categoria de servicio"),
                ),
              ),
            )),
            // Dropdown para escoger el servicio de la categoria
            SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              ),
              child: GetBuilder<CreateDoneJobController>(
                id: 'servicios',
                builder: (controller) => DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  value: _.getSelectedServicio,
                  items: _.getServicios.map((Servicio value) {
                    return new DropdownMenuItem(
                      value: value.id,
                      child: new Text(value.nombre),
                    );
                  }).toList(),
                  onChanged: (value) => _.onServicioChanged(value),
                  hint: Text("Servicio asociado"),
                ),
              ),
            )), */
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Añadir trabajo realizado",
            instruction:
                "Añade trabajos o contratos que hayas ejecutado, las empresas basan sus decisiones alrededor tu experiencia como proveedor",
            onTap: () => print("Hola"),
            icon: Icon(Icons.add),
            color: Colors.black),
      ),
    );
  }
}

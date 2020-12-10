import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/button_navigator.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';

class CreateCuponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCuponController>(
        builder: (_) => GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    CustomAppBar(title: "Crear cupon", onTap: () => Get.back()),
                    // Campo de texto para el titulo del cupon
                    SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.name,
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.bluedark, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Titulo del cupon',
                            ),
                            onChanged: (value) => _.onTituloCuponChanged(value),
                          ),
                        )),
                    // Dropdown para Servicio asociado
                    SliverToBoxAdapter(
                        child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                      ),
                      child: GetBuilder<CreateCuponController>(
                        id: 'servicios',
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
                          onChanged: (value) => _.onServicioChanged(value),
                          hint: Text("Servicio asociado"),
                          value: _.getSelectedServicio,
                        ),
                      ),
                    )),
                    // Dropdown para Categoria de servicio
                    SliverToBoxAdapter(
                        child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                      ),
                      child: GetBuilder<CreateCuponController>(
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
                    // Campo de texto para la descripcion del cupon
                    SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            autofocus: true,
                            maxLines: 4,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.bluedark, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Descripción del cupón',
                            ),
                            onChanged: (value) =>
                                _.onDescripCuponChanged(value),
                          ),
                        )),
                    // Campo de texto para Precio original
                    SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.monetization_on,
                                color: Constants.bluelight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.bluedark, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Precio original',
                            ),
                            onChanged: (value) => _.onPrecioCuponChanged(value),
                          ),
                        )),
                    // Campo de texto para Porcentaje descuento
                    SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.money_off,
                                color: Constants.bluelight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.bluedark, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Porcentaje descuento',
                            ),
                            onChanged: (value) =>
                                _.onPorcentajeCuponChanged(value),
                          ),
                        )),
                    // Campo de texto para Fecha límite de redención
                    SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.date_range,
                                color: Constants.bluelight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.bluedark, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Fecha límite de redención',
                            ),
                            onChanged: (value) =>
                                _.onFechaLimiteCuponChanged(value),
                          ),
                        )),
                  ],
                ),
                bottomNavigationBar: ButtomBottomNav(
                    titleButton: "Crear cupón ",
                    instruction:
                        "Crea cupónes para que tus clientes obtengan descuentos cuando te seleccionen de manera directa como proveedor",
                    onTap: () => _.onCreateCupon(),
                    icon: Icon(Icons.add),
                    color: Colors.black),
              ),
            ));
  }
}

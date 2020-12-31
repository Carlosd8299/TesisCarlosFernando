import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/utils/constants.dart';

import 'add_categories_proveedor_controller.dart';

class AddCategoriasProveedorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCategoriesController>(
        builder: (_) => Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(0, 50),
              child: AppBar(
                elevation: 0,
                title: SizedBox(
                  child: Text(
                    "Asignacion de categorías",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            body: new Column(children: [
              new Container(
                padding:
                    new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
                decoration: new BoxDecoration(color: Constants.bluelight),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Card(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.all(7.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GetBuilder<AddCategoriesController>(
                                    id: 'categorias',
                                    builder: (controller) => Expanded(
                                        child: DropdownButton(
                                      isExpanded: true,
                                      underline: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border(bottom: BorderSide.none),
                                        ),
                                      ),
                                      hint: Text("Categorías"),
                                      value: _.getSelectedCategoria,
                                      items: _.getCategorias
                                          .map((Categoria value) {
                                        return new DropdownMenuItem(
                                          value: value.id,
                                          child: new Text(value.nombre),
                                        );
                                      }).toList(),
                                      onChanged: (value) =>
                                          _.onCategoriaChanged(value),
                                    )),
                                  ),
                                  new GestureDetector(
                                      onTap: () => _.onCategoriaSubmited(),
                                      child: new Padding(
                                        padding: new EdgeInsets.all(7.0),
                                        child: new Icon(Icons.add_circle),
                                      )),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 500,
                      minHeight: 100,
                      minWidth: 200,
                      maxWidth: 400),
                  child: GetBuilder<AddCategoriesController>(
                      id: 'categorias_proveedor',
                      builder: (controller) => ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _.getCategoriasProveedor.length,
                            itemBuilder: (context, index) {
                              String categoria =
                                  _.getCategoriasProveedor[index].nombre;
                              Color color = Constants.colorlist[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: color,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 6,
                                            offset: Offset(1, 3))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      categoria.trim(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ))),
            ])));
  }
}

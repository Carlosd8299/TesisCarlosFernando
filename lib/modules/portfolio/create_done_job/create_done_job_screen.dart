import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/button_navigator.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import 'create_done_job_controller.dart';

class CreateDoneJobScreen extends StatefulWidget {
  @override
  _CreateDoneJobScreenState createState() => _CreateDoneJobScreenState();
}

class _CreateDoneJobScreenState extends State<CreateDoneJobScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedFechaInicio = DateTime.now();
    // ignore: unused_local_variable
    DateTime selectedFechaFin = DateTime.now();

    _selectedDate(BuildContext context, function, DateTime fecha) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != fecha)
        setState(() {
          function(picked);
        });
    }

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
                    onChanged: (value) => _.onTituloChanged(value),
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
                    onChanged: (value) => _.onDecripcionChanged(value),
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
                    onChanged: (value) => _.onEmpresaChanged(value),
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
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Text(
                      "Fecha de inicio de ejecucion:",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Constants.greenflatbutton,
                      ),
                      onPressed: () {
                        _selectedDate(
                            context,
                            (value) => {_.onFechaInicioChanged(value)},
                            selectedFechaInicio);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${_.fechaInicio.toLocal()}".split(' ')[0],
                      style: TextStyle(
                          color: Constants.greenflatbutton, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Text(
                      "Fecha de fin de ejecucion:",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Constants.greenflatbutton,
                      ),
                      onPressed: () {
                        _selectedDate(
                            context,
                            (value) => {_.onFechaFinChanged(value)},
                            _.fechaFin);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${_.fechaFin.toLocal()}".split(' ')[0],
                      style: TextStyle(
                          color: Constants.greenflatbutton, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
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
                  id: 'categorias',
                  builder: (_) => DropdownButton(
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        hint: Text("Seleccione una categoria"),
                        value: _.getCategoria,
                        items: _.getCategorias.map((Categoria value) {
                          return new DropdownMenuItem(
                            value: value.id,
                            child: new Text(value.nombre),
                          );
                        }).toList(),
                        onChanged: (value) => {
                          setState(() {
                            _.onCategoriaChanged(value);
                          })
                        },
                      )),
            )),
            //Drop para seleccionar servicio
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
                  builder: (_) => DropdownButton(
                        hint: Text("Selecciones una servicio"),
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        value: _.getServicio,
                        items: _.getServicios.map((Servicio value) {
                          return new DropdownMenuItem(
                            value: value.id,
                            child: new Text(value.nombre),
                          );
                        }).toList(),
                        onChanged: (value) => {
                          setState(() {
                            _.onServicioChanged(value);
                          })
                        },
                      )),
            )),
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Añadir trabajo realizado",
            instruction:
                "Añade trabajos o contratos que hayas ejecutado, las empresas basan sus decisiones alrededor tu experiencia como proveedor",
            onTap: () => _.createDoneJob(),
            icon: Icon(Icons.add),
            color: Colors.black),
      ),
    );
  }
}

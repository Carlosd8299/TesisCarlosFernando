import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_create/create_proceso_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

class CreateProcesoSeleccionScreen extends StatefulWidget {
  @override
  _CreateProcesoSeleccionScreenState createState() =>
      _CreateProcesoSeleccionScreenState();
}

class _CreateProcesoSeleccionScreenState
    extends State<CreateProcesoSeleccionScreen> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context, function) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        function(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProcesoController>(
      builder: (_) => Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomAppBar(
                  title: "Abrir proceso de selección", onTap: () => Get.back()),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          function: (value) => {_.onTituloChanged(value)},
                          label: 'Titulo de la oferta',
                          hint:
                          'Ej: Desarrollo de aplicacion movil a la medida para inventario'))),
              //Drop para seleccionar la categoria de la oferta
              SliverToBoxAdapter(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: Colors.grey, style: BorderStyle.solid, width: 1.0),
                ),
                    child: GetBuilder<CreateProcesoController>(
                        id: 'categorias',
                        builder: (_) =>
                            DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  hint: Text("Seleccione una categoria"),
                              value: 1,
                              items: _.getCategorias.map((Categoria value) {
                                return new DropdownMenuItem(
                                  value: value.id,
                                  child: new Text(value.nombre),
                                );
                              }).toList(),
                              onChanged: (value) => _.onCategoriaChanged(value),
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
                    child: GetBuilder<CreateProcesoController>(
                        id: 'servicios',
                        builder: (_) =>
                            DropdownButton(
                              hint: Text("Selecciones una servicio"),
                              underline: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide.none),
                                ),
                              ),
                              value: 1,
                              items: _.getServicios.map((Servicio value) {
                                return new DropdownMenuItem(
                                  value: value.id,
                                  child: new Text(value.nombre),
                                );
                              }).toList(),
                              onChanged: (value) =>
                              {
                                _.onServicioChanged(value)
                              },
                            )),
              )),
              //DropDown para seleccionar la categoria
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          function: (value) => _.onDescripcionChanged(value),
                          maxlines: 4,
                          label: 'Descripción del servicio',
                          hint:
                          'Explicacion detallada del servicio o producto requerido'))),
              //Texbox TYC
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          function: (value) => _.onCriteriosChanged(value),
                          maxlines: 3,
                          label: 'Condiciones y criterios',
                          hint:
                          'Ej: Experiencia del proveedor en ejeuciones parecidas, condiciones para el cumplimiento de la solicitud y demas condiciones especificas'))),
              //Texbox presupuesto inicial
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          function: (value) => _.onPresupuestoChanged(value),
                          label: 'Presupuesto inicial',
                          hint:
                          'Ej: Desarrollo de aplicacion movil a la medida para inventario'))),

              //Date picker Fecha de inicio de ejecucion:
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
                          _selectDate(context, (value) =>
                          {
                            _.onFechaSolicitudChanged(value)
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Constants.greenflatbutton, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              //Date Picker Fecha de inicio de recepción de oferta:
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        "Fecha de inicio de recepción de oferta:",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Constants.yellowflatbutton,
                        ),
                        onPressed: () {
                          _selectDate(context, (value) =>
                          {
                            _.onFechaSolicitudChanged(value)
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        (_.fechaSolicitud != null)
                            ? _.fechaSolicitud
                            : "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Constants.yellowflatbutton, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              //Date Picker Fecha de fin de recepción de oferta
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        "Fecha de fin de recepción de oferta",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _selectDate(context, (value) =>
                          {
                            _.onfechaFinRecepcionChanged(value)
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        (_.fechaFinRecepcion != null)
                            ? _.fechaFinRecepcion
                            : "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              //Date Picker Fecha de inicio de selección:
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        "Fecha de inicio de selección:",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Constants.bluedark,
                        ),
                        onPressed: () {
                          _selectDate(context, (value) =>
                          {
                            _.onfechaSeleccionChanged(value)
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        (_.fechaSeleccion != null)
                            ? _.fechaSeleccion
                            : "${selectedDate.toLocal()}".split(' ')[0],
                        style:
                            TextStyle(color: Constants.bluedark, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              //Date Picker Fecha de fin de selección
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        "Fecha de fin de selección:",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Constants.redflatbutton,
                        ),
                        onPressed: () {
                          _selectDate(context, (value) =>
                          {
                            _.onfechafinSeleccionChanged(value)
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        (_.fechafinSeleccion != null)
                            ? _.fechafinSeleccion
                            : "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Constants.redflatbutton, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: ButtomBottomNav(
              titleButton: "Subir proceso de selección",
              instruction: "Abre el proceso de selección y recibe ofertas, elige un ganador",
              onTap: () => _.crearSolicitud(),
              icon: Icon(Icons.arrow_forward),
              color: Colors.black)),
    );
  }
}

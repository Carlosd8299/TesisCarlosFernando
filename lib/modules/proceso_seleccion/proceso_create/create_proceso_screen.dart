import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
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

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) => Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomAppBar(
                  title: "Abrir proceso de selección", onTap: () => print("")),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
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
                child: DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  items: null,
                  onChanged: null,
                  hint: Text("Seleccione una categoria"),
                ),
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
                child: DropdownButton(
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  items: null,
                  onChanged: null,
                  hint: Text("Selecciones una servicio"),
                ),
              )),
              //DropDown para seleccionar la categoria
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          maxlines: 4,
                          label: 'Descripción del servicio',
                          hint:
                              'Explicacion detallada del servicio o producto requerido'))),
              //Texbox TYC
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          maxlines: 3,
                          label: 'Condiciones y criterios',
                          hint:
                              'Ej: Experiencia del proveedor en ejeuciones parecidas, condiciones para el cumplimiento de la solicitud y demas condiciones especificas'))),
              //Texbox presupuesto inicial
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          label: 'Presupuesto inicial',
                          hint:
                              'Ej: Desarrollo de aplicacion movil a la medida para inventario'))),
              // Textbox Cantidad Dias para recibir contraoferta
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Cantidad Dias para recibir contraoferta",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.bluedark, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      hintText: "Ej: 5",
                    ),
                  ),
                ),
              ),
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
                          _selectDate(context);
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
                          _selectDate(context);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
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
                          _selectDate(context);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
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
                          _selectDate(context);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
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
                          _selectDate(context);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
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
              instruction:
                  "Abre el proceso de selección y recibe ofertas, elige un ganador",
              onTap: () => print("Hola"),
              icon: Icon(Icons.arrow_forward),
              color: Colors.black)),
    );
  }
}

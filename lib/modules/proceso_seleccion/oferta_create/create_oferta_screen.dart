import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_create/create_oferta_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

class OfertaCreateScreen extends StatefulWidget {
  @override
  _OfertaCreateScreenState createState() => _OfertaCreateScreenState();
}

class _OfertaCreateScreenState extends State<OfertaCreateScreen> {
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
    return GetBuilder<CreateOfertaController>(
      builder: (_) => Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomAppBar(
                  title: "Crear oferta al proceso de seleccion",
                  onTap: () => Get.back()),
              //Texbox titulo
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          type: TextInputType.name,
                          function: (value) => _.onTituloChanged(value),
                          label: 'Titulo de la propuesta',
                          hint: 'Ej: Propuesta de ejecución proyecto CGTI'))),
              //Texbox descripción de la propuesta
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          maxlines: 4,
                          type: TextInputType.text,
                          function: (value) => _.onDescChanged(value),
                          label: 'Descripción de la propuesta',
                          hint:
                              'Contenido de la propuesta de valor para el proceso de selección'))),
              //Texbox presupuesto de la propuesta
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          type: TextInputType.number,
                          function: (value) => _.onPresupuestoChanged(value),
                          label: 'Presupuesto de la propuesta',
                          hint: 'Cantidad en dinero'))),

              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: CustomField(
                          type: TextInputType.number,
                          function: (value) => {_.onPlazoChanged(value)},
                          label: 'Tiempo de ejecucion de la propuesta',
                          hint: 'Cantidad en dias'))),

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
                          _selectDate(context,
                              (value) => {_.onFechaFinEjecucionChanged(value)});
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
            ],
          ),
          bottomNavigationBar: ButtomBottomNav(
              titleButton: "Crear oferta",
              instruction:
                  "Envíale tu propuesta a la empresa para participar de este proceso de seleecion",
              onTap: () => _.crearOferta(),
              icon: Icon(Icons.arrow_forward),
              color: Colors.black)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/modules/sign_up/sign_up_controller.dart';
import 'package:itsuit/widgets/widgets.dart';

class SignUpProveedor extends StatelessWidget {
  List<DropdownMenuItem<int>> items = [
    DropdownMenuItem(
      child: Text("CC"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("Nit"),
      value: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CurveShape(height: 80),
                  SizedBox(
                    height: 10,
                  ),
                  //Titulo
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Registro proveedores",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Textbox Nombre de la empresa
                        Container(
                          width: 170,
                          height: 50,
                          child: TextField(
                            onChanged: (value) =>
                                _.onNombreProveedorChanged(value),
                            decoration: const InputDecoration(
                              labelText: "Nombre de la empresa",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        // DropDown de Tipo de documento
                        DropdownButton(
                          hint: Text("Tipo de documento"),
                          value: _.getTipoDocumentoProveedor,
                          underline: Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide.none),
                            ),
                          ),
                          items: items,
                          onChanged: (value) =>
                              _.onTipoDocumentoProveedorChanged(value),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // DropDown de RegimenTributario
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: AlignmentDirectional.center,
                      child: DropdownButton(
                        hint: Text(" RegimenTributario"),
                        value: _.getRegimenTributario,
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        items: _.getRegimenes.map((Regimen value) {
                          return new DropdownMenuItem(
                            value: value.id,
                            child: new Text(value.nombre),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            _.onRegimenTributarioProveedorChanged(value),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // DropDown de actividad economica
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: AlignmentDirectional.center,
                      child: DropdownButton(
                        hint: Text("Actividad Economica"),
                        value: _.getActEconomicaProveedor,
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        items: _.getActividades.map((ActividadEco value) {
                          return new DropdownMenuItem(
                            value: value.id,
                            child: new Text(value.nombre),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            _.onActEconomicaProveedorChanged(value),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // textbox direccion
                        Container(
                          width: 170,
                          height: 50,
                          child: TextField(
                            onChanged: (value) =>
                                _.onDireccionProveedorChanged(value),
                            decoration: InputDecoration(
                              labelText: "Dirección",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                        // textbox Correo electronico
                        Container(
                          height: 50,
                          width: 170,
                          child: TextField(
                            onChanged: (value) =>
                                _.onCorreoProveedorChanged(value),
                            decoration: InputDecoration(
                              labelText: "Correo electronico",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Numero id text
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 170,
                          height: 50,
                          child: TextField(
                            onChanged: (value) =>
                                _.onNumeroIdProveedorChanged(value),
                            decoration: InputDecoration(
                              labelText: "Numero de ID",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //num Telefono
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextField(
                      onChanged: (value) => _.onPhoneProveedorChanged(value),
                      decoration: InputDecoration(
                        labelText: "Numero de telefono",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  //num celular
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextField(
                      onChanged: (value) => _.onCellroveedorChanged(value),
                      decoration: InputDecoration(
                        labelText: "Numero de celular",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  //num Telefono
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextField(
                      onChanged: (value) =>
                          _.onExpProveedorChanged(int.parse(value)),
                      decoration: InputDecoration(
                        labelText: "Tiempo de experiencia en meses",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  //Tetx contraseña
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: TextField(
                        onChanged: (value) =>
                            _.onPasswordProveedorChanged(value),
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      )),
                  //Tetx confrim contraseña
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: TextField(
                        onChanged: (value) =>
                            _.onConfirmPasswordProveedorChanged(value),
                        decoration: InputDecoration(
                          labelText: "Confirmar contraseña",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      )),
                  Row(
                    children: [
                      GetBuilder(
                        id: 'tyc',
                        builder: (controller) => Checkbox(
                            value: _.getTycProveedor,
                            onChanged: (value) =>
                                _.onConfirmTYCProveedorChanged(value)),
                      ),
                      Text("Aceptar Terminos y condiciones"),
                    ],
                  ),
                  SizedBox(height: 20),
                  GradienButtton(
                      text: "Continuar",
                      width: 200,
                      gradient: bluegradient(),
                      onTap: () => _.onProveedorSubmit())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

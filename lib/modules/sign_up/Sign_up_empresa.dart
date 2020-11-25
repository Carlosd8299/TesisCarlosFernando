import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/modules/sign_up/sign_up_controller.dart';
import 'package:itsuit/widgets/widgets.dart';

class SignUpEmpresa extends StatelessWidget {
  List<DropdownMenuItem<int>> items2 = [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CurveShape(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
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
                          "Registro Solicitantes",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  //textbox Nombre del cliente
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Container(
                      width: 400,
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          _.onNombreClienteChanged(value);
                        },
                        decoration: const InputDecoration(
                          labelText: "Nombre del cliente",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  /* DropdownButton(
                    hint: Text("Tipo de documento"),
                    value: _.getTipoDocumentoEmpresa,
                    underline: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide.none),
                      ),
                    ),
                    items: items,
                    onChanged: (value) => _.onTipoDocumentoempresaChanged(value),
                  ),
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
                        value: _.getRegimenTributarioEmpresa,
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
                            _.onRegimenTributarioempresaChanged(value),
                      ),
                    ),
                  ), */
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[100]),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        height: 50,
                        width: 400,
                        child: TextField(
                          onChanged: (value) => _.onCorreoempresaChanged(value),
                          decoration: InputDecoration(
                            labelText: "Correo electronico",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        value: _.getActEconomicaEmpresa,
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
                            _.onActividadEconomicaEmpresaChanged(value),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        value: _.getRegimenTributarioEmpresa,
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
                            _.onRegimenTributarioempresaChanged(value),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  // DropDown de RegimenTributario

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: 400,
                      child: TextField(
                        onChanged: (value) =>
                            _.onDireccionempresaChanged(value),
                        decoration: InputDecoration(
                          labelText: "Dirección",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ),

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
                                _.onNumeroIdempresaChanged(value),
                            decoration: InputDecoration(
                              labelText: "Numero de ID",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        DropdownButton(
                          hint: Text("Tipo de documento"),
                          value: _.getTipoDocumentoEmpresa,
                          underline: Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide.none),
                            ),
                          ),
                          items: items2,
                          onChanged: (value) =>
                              _.onTipoDocumentoempresaChanged(value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: 400,
                      child: TextField(
                        onChanged: (value) => _.onPhoneempresaChanged(value),
                        decoration: InputDecoration(
                          labelText: "Numero de telefono",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: 400,
                      child: TextField(
                        onChanged: (value) => _.onCellEmpresaChanged(value),
                        decoration: InputDecoration(
                          labelText: "Numero de celular",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextField(
                        onChanged: (value) => _.onPasswordempresaChanged(value),
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: TextField(
                        onChanged: (value) =>
                            _.onConfirmPasswordempresaChanged(value),
                        decoration: InputDecoration(
                          labelText: "Confirmar contraseña",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      )),
                  Row(
                    children: [
                      GetBuilder(
                        id: 'tycempresa',
                        builder: (controller) => Checkbox(
                            value: _.getTycEmpresa,
                            onChanged: (value) =>
                                _.onConfirmTYCempresaChanged(value)),
                      ),
                      Text("Aceptar Terminos y condiciones"),
                    ],
                  ),
                  SizedBox(height: 10),
                  GradienButtton(
                      text: "Continuar",
                      width: 200,
                      gradient: bluegradient(),
                      onTap: () => _.onEmpresaSubmit())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

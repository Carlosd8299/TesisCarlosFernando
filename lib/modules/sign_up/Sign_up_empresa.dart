import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/sign_up/sign_up_controller.dart';
import 'package:itsuit/widgets/widgets.dart';

class SignUpEmpresa extends StatelessWidget {
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      child: Text("CC"),
      value: "CC",
    ),
    DropdownMenuItem(
      child: Text("Nit"),
      value: "NIT",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CurveShape(height: 60),
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
                        "Registro",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    "Clientes",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    width: 400,
                    child: TextField(
                      onChanged: (value) {
                        _.onNombreClieneChanged(value);
                      },
                      decoration: const InputDecoration(
                        labelText: "Nombre del cliente",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: AlignmentDirectional.center,
                      child: DropdownButton(
                        hint: Text("Tipo de documento"),
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        items: items,
                        onChanged: (value) => print(value.toString()),
                      ),
                    ),
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: AlignmentDirectional.center,
                      child: DropdownButton(
                        hint: Text("Regímen"),
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        items: items,
                        onChanged: (value) => print(value.toString()),
                      ),
                    ),
                  ],
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
                          decoration: InputDecoration(
                            labelText: "Dirección",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 170,
                        child: TextField(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 170,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Numero de ID",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 170,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Año creación compañía",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: 400,
                    child: TextField(
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
                    child: TextField(
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
                      decoration: InputDecoration(
                        labelText: "Confirmar contraseña",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    )),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) => print(value.toString()),
                    ),
                    Text("Aceptar Terminos y condiciones"),
                  ],
                ),
                SizedBox(height: 10),
                GradienButtton(
                    text: "Continuar",
                    width: 200,
                    gradient: bluegradient(),
                    onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

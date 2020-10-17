import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/reomote/auth_api.dart';
import 'package:itsuit/modules/home/home_controller.dart';
import 'package:itsuit/widgets/switcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Switcher(HomeProveedor(), HomeEmpresa(), 2
            // _.getToken.usuario.idTipoUsuario,
            ));
  }
}

class HomeProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: Center(child: Text("Es un proveedor"))),
      ),
    );
  }
}

class HomeEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Center(child: Text("Es una empresa")))),
    );
  }
}

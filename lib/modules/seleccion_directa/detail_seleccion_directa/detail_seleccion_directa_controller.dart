import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class DetailSeleccionDirectaController extends GetxController {
  ProcesoSeleccion proceso;
  RequestToken r;
  bool _botonActivado = true;
  int tipoUsuario;
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  bool get getbotnActivado => _botonActivado;
  int get getTipoUsuario => tipoUsuario;
  Future<bool> cambioEstadoSolicitud(int estado) async {
    bool res = await _apirepo.cambioEstadoSolicitud(proceso.id, estado);
    return res;
  }

  aprobarSolicitud() async {
    if (proceso.estado != 3 && proceso.estado != 4) {
      bool res = await cambioEstadoSolicitud(4);
      proceso.estado = 4;
      if (res) {
        Get.dialog(AlertDialog(
            title: Text("¡Proceso exitoso!"),
            content: Text("Se ha aprobado la solicitud directa"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.back();
                    Get.offNamed(AppRoutes.OWNPROFILE, arguments: r);
                  },
                  child: Text("OK"))
            ]));
      } else {
        Get.dialog(AlertDialog(
            title: Text("¡Ha ocurrido un error!"),
            content: Text(""),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("OK"))
            ]));
      }
    }
  }

  rechazarSolicitud() async {
    if (proceso.estado != 3 && proceso.estado != 4) {
      bool res = await cambioEstadoSolicitud(3);
      proceso.estado = 3;
      if (res) {
        Get.dialog(AlertDialog(
            title: Text("¡Proceso exitoso!"),
            content: Text("Se ha rechazado la solicitud directa"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.back();
                    Get.offNamed(AppRoutes.OWNPROFILE, arguments: r);
                  },
                  child: Text("OK"))
            ]));
      } else {
        Get.dialog(AlertDialog(
            title: Text("¡Ha ocurrido un error!"),
            content: Text(""),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("OK"))
            ]));
      }
    }
  }

  @override
  void onInit() async {
    proceso = Get.arguments[0] as ProcesoSeleccion;
    tipoUsuario = Get.arguments[1] as int;
    r = await LocalAuth().getSession();
    if (proceso.estado != 3 && proceso.estado != 4) {
      _botonActivado = true;
    } else {
      _botonActivado = true;
    }
    super.onInit();
  }
}

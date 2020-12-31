import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class CreateOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  ProcesoSeleccion procesoSeleccion;

  String _titulo, _descr;
  int _plazo = 0;
  DateTime _fechaInicioEjecucion;
  double _presupuesto = 0.00;

  onTituloChanged(value) {
    _titulo = value;
  }

  onPlazoChanged(value) {
    if (isNumeric(value.trim())) {
      _plazo = int.parse(value.trim());
    }
  }

  onDescChanged(value) {
    _descr = value;
  }

  onPresupuestoChanged(value) {
    if (isNumeric(value.trim())) {
      _presupuesto = double.parse(value.trim());
    }
  }

  onFechaFinEjecucionChanged(value) {
    _fechaInicioEjecucion = value;
  }

  crearOferta() async {
    bool res = await _apirepo.createOferta(
        procesoSeleccion.id,
        r.usuario.idTercero,
        (_fechaInicioEjecucion == null)
            ? DateTime.now().toString()
            : _fechaInicioEjecucion.toString(),
        _titulo,
        _plazo,
        _descr,
        _presupuesto);
    if (res) {
      Get.dialog(AlertDialog(
          title: Text("¡Proceso exitoso!"),
          content: Text("Se ha creado la solicitud"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.HOME, arguments: r);
                },
                child: Text("OK"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡Ha ocurrido un error!"),
          content:
              Text("Por favor verifique que toda la información esté completa"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  @override
  void onInit() async {
    r = await LocalAuth().getSession();
    procesoSeleccion = Get.arguments as ProcesoSeleccion;
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/contraOferta.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class DetailContraOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  ContraOfertas contraOferta;
  ProcesoSeleccion procesoSeleccion;
  RequestToken r;

  Future<void> rechazarOferta() async {
    bool response =
        await _apirepo.actualizarEstadoContraOferta(this.contraOferta.id, 3);
    if (response) {
      Get.dialog(AlertDialog(
          title: Text("¡Proceso exitoso!"),
          content: Text("Se ha rechazado la oferta"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡Ha ocurrido un error!"),
          content: Text("No ha sido posible rechazar esta contra oferta"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    }
  }

  Future<void> aprobarOferta() async {
    bool response =
        await _apirepo.actualizarEstadoContraOferta(this.contraOferta.id, 4);
    if (response) {
      Get.dialog(AlertDialog(
          title: Text("¡Se ha aprobado la contra oferta!"),
          content: Text(
              "Será redireccionado a la oferta inicial con el fin que la ajuste a los nuevos criterios"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.CREATEOFERTA,
                      arguments: this.procesoSeleccion);
                },
                child: Text("OK"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡Ha ocurrido un error!"),
          content: Text(
              "No ha sido posible aprobar esta contra-oferta, asegurese de no haber aprobado o rechazado anteriormente"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    }
  }

  void loadSolcitudes() async {
    final data = await _apirepo.getSolicitudes(
        this.contraOferta.idSolicitante, this.contraOferta.id);
    this.procesoSeleccion = data.data[0];
  }

  @override
  void onInit() async {
    this.contraOferta = Get.arguments as ContraOfertas;
    this.r = await LocalAuth().getSession();
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/contraOferta.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class DetailOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  bool _botonActivado = true;
  Oferta oferta;
  ContraOfertas contraOferta;
  int _idTipoUsurio;
  int get getTipoUsuario => _idTipoUsurio;
  bool get getbotnActivado => _botonActivado;

  Future<void> rechazarOferta() async {
    bool response =
        await _apirepo.cambioEstadoOferta(this.oferta.idRespuesta, 3);
    Get.offNamed(AppRoutes.DETAILPROCESO);
    _botonActivado = false;
    print(response);
  }

  Future<void> loadDetail() async {
    ContraOferta response =
        await _apirepo.getListContraOfertas(oferta.idRespuesta);
    if (response.result.data.length > 0) {
      this.contraOferta = response.result.data[0];
    }
  }

  detailContraOferta() {
    if (this.contraOferta != null) {
      Get.toNamed(AppRoutes.DETAILCONTRAOFERTA, arguments: this.contraOferta);
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡No hay contraofertas!"),
          content: Text(
              "No se han registrado contraofertas aplicadas a esta oferta."),
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
        await _apirepo.cambioEstadoOferta(this.oferta.idRespuesta, 4);

    if (response) {
      Get.dialog(AlertDialog(
          title: Text("¡Proceso exitoso!"),
          content: Text("Se ha aprobado la oferta"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.DETAILPROCESO);
                },
                child: Text("OK"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡Ha ocurrido un error!"),
          content: Text(
              "No ha sido posible aprobar esta oferta, asegurese de no haber aprobado alguna anteriormente"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    }
    _botonActivado = false;
  }

  @override
  void onInit() async {
    oferta = Get.arguments[0] as Oferta;
    _idTipoUsurio = Get.arguments[1] as int;
    this.r = await LocalAuth().getSession();
    _botonActivado = (oferta.estado == 3 || oferta.estado == 4) ? false : true;
    await loadDetail();
    super.onInit();
  }
}

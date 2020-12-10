import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class DetailsCuponController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  Cupon _cupon;
  int _tipoUser;

  Future<void> eliminarCupon(int idCupon) async {
    final data = await _apirepo.desactivarCupon(idCupon);
    if (data) {
      Get.dialog(AlertDialog(
          title: Text("Se ha eliminado el cupón"),
          content: Text(
              "El cupón ${this._cupon.titulo} ahora esta desactivado, y mas nadie lo puede adquirir"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("Error"),
          content: Text("Imposible desactivar el cupón ${this._cupon.titulo}"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ]));
    }
  }

  Cupon get getCupon => _cupon;
  int get geTipoUser => _tipoUser;

  @override
  void onInit() {
    _cupon = Get.arguments[0] as Cupon;
    _tipoUser = Get.arguments[1] as int;
    super.onInit();
  }
}

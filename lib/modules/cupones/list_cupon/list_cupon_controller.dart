import 'dart:io';

import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListCuponController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  Proveedor proveedor;
  List<Cupon> _cupones = [];
  int _longitudLista;

  Future<void> getListCupones() async {
    try {
      final data = await _apirepo.consultarCuponesProveedor(proveedor.id);
      _cupones = data;
      _longitudLista = data.length;
      update(['listacupones']);
    } on HttpException catch (e) {
      printError();
    }
  }

  RequestToken get getToken => _r;
  int get getLenght => _longitudLista;
  List<Cupon> get getListaCupones => this._cupones;

  @override
  void onInit() async {
    this._r = Get.arguments[0] as RequestToken;
    this.proveedor = Get.arguments[1] as Proveedor;
    await this.getListCupones();
    super.onInit();
  }
}

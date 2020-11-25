import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/provider/reomote/api.dart';

class ApiRepository {
  final Apis _apis = Get.find<Apis>();
  Future<Ubicacion> getCiudades() => _apis.getListCiudades();
  Future<RegimenTributario> getRegimenes() => _apis.getListTributario();
  Future<ActividadEconomica> getActEco() => _apis.getListActEco();
  //Future<List<Ciudade>> getCiudades() => _apis.getListCiudades();
}

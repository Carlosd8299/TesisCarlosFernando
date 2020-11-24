import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/provider/reomote/api.dart';

class ApiRepository {
  final Apis apis = Get.find<Apis>();
  Future<RegimenTributario> getRegimenes() => apis.getListTributario();
  Future<ActividadEconomica> getActEco() => apis.getListActEco();
}

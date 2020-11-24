import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';

class Apis {
  final Dio _dio = Get.find<Dio>();

  Future<RegimenTributario> getListTributario() async {
    try {
      final Response response = await _dio.get('RegimenTributario');
      print(response.data);
      return RegimenTributario.fromJson(response.data);
    } catch (e) {}
  }

  Future<ActividadEconomica> getListActEco() async {
    try {
      final Response response = await _dio.get('ActividadEconomica');
      print(response.data);
      return ActividadEconomica.fromJson(response.data);
    } catch (e) {}
  }
}

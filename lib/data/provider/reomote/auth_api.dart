import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class AuthApi {
  final Dio _dio = Get.find<Dio>();
  final LocalAuth localAuth = new LocalAuth();

  // ignore: missing_return
  Future<RequestToken> validateWithLogin(
      {@required String username, @required String password}) async {
    try {
      final Response response = await _dio.post(
        "login",
        data: {
          "username": username,
          "password": password,
        },
      );
      return RequestToken.fromJson(response.data);
    } catch (e) {
      printError();
    }
  }

  Future<bool> signUpProveedor({
    @required int idTipoDocumento,
    @required int idRegimenTributario,
    @required int idActividadEconomica,
    @required int idCiudad,
    @required String dni,
    @required String digito,
    @required String nombreTercero,
    @required String fechaRegistro,
    @required String email,
    @required String telefono,
    @required String celular,
    @required String direccion,
    @required int tiempoExperiencia,
    @required String password,
  }) async {
    try {
      bool x = false;
      final Response response = await _dio.post("proveedor", data: {
        "id_tipo_documento": idTipoDocumento,
        "id_regimen_tributario": idRegimenTributario,
        "id_actividad_economica": idActividadEconomica,
        "id_ciudad": 3,
        "dni": dni,
        "nombre_tercero": nombreTercero,
        "fecha_registro": fechaRegistro,
        "email": email,
        "telefono": telefono,
        "celular": celular,
        "direccion": direccion,
        "tiempo_experiencia": tiempoExperiencia,
        "password": password,
        "estado": 1
      });
      if (response.statusCode != 200) {
        x = true;
      }
      return x;
    } catch (e) {
      printError();
      return false;
    }
  }

  Future<bool> signUpEmpresa({
    @required int idTipoDocumento,
    @required int idRegimenTributario,
    @required int idActividadEconomica,
    @required String dni,
    @required String nombreTercero,
    @required String email,
    @required String telefono,
    @required String celular,
    @required String direccion,
    @required int tiempoExperiencia,
    @required String password,
  }) async {
    try {
      bool x = false;
      final Response response = await _dio.post("proveedor", data: {
        "id_tipo_tercero": 2,
        "id_tipo_documento": idTipoDocumento,
        "id_regimen_tributario": idRegimenTributario,
        "id_actividad_economica": idActividadEconomica,
        "id_ciudad": 3,
        "dni": dni,
        "nombre_tercero": nombreTercero,
        "fecha_registro": '2020-10-10',
        "email": email,
        "telefono": telefono,
        "celular": celular,
        "direccion": direccion,
        "tiempo_experiencia": tiempoExperiencia,
        "password": password,
        "estado": 1
      });
      if (response.statusCode != 200) {
        x = true;
      }
      return x;
    } catch (e) {
      printError();
      return false;
    }
  }
}

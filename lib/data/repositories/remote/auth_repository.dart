import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/reomote/auth_api.dart';

class AuthRepository {
  final AuthApi _api = Get.find<AuthApi>();

  Future<RequestToken> authWithLogin({
    @required String username,
    @required String password,
  }) =>
      _api.validateWithLogin(
        username: username,
        password: password,
      );
  // ignore: missing_return
  Future<bool> signUpProveedor({
    @required int idTipoDocumento,
    @required int idRegimenTributario,
    @required int idActividadEconomica,
    @required String dni,
    @required String nombreTercero,
    @required String fechaRegistro,
    @required String email,
    @required String telefono,
    @required String celular,
    @required String direccion,
    @required int tiempoExperiencia,
    @required String password,
  }) async {
    bool response = await _api.signUpProveedor(
        idTipoDocumento: idTipoDocumento,
        idRegimenTributario: idRegimenTributario,
        idActividadEconomica: idActividadEconomica,
        idCiudad: 3,
        dni: dni,
        digito: 'idk',
        nombreTercero: nombreTercero,
        fechaRegistro: fechaRegistro,
        email: email,
        telefono: telefono,
        celular: celular,
        direccion: direccion,
        tiempoExperiencia: tiempoExperiencia,
        password: password);
    return response;
  }

  Future<void> signUpEmpresa({
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
  }) =>
      _api.signUpEmpresa(
          idTipoDocumento: idTipoDocumento,
          idRegimenTributario: idRegimenTributario,
          idActividadEconomica: idActividadEconomica,
          dni: dni,
          nombreTercero: nombreTercero,
          email: email,
          telefono: telefono,
          celular: celular,
          direccion: direccion,
          tiempoExperiencia: tiempoExperiencia,
          password: password);
}

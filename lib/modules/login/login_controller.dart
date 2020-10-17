import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';

import 'package:itsuit/data/provider/reomote/auth_api.dart';
import 'package:itsuit/routes/my_routes.dart';

class LoginController extends GetxController {
  String _username = "", _password = "";

  final AuthApi _api = Get.find<AuthApi>();

  void onUserNamechanged(String text) {
    _username = text;
  }

  void onPasswordchanged(String text) {
    _password = text;
  }

  Future submit() async {
    try {
      final RequestToken token = await _api.validateWithLogin(
          username: _username, password: _password);
      Get.offNamed(AppRoutes.HOME, arguments: token);
      /* print(token.usuario);
      if (token.usuario != null) {
        print("Login controller ${token.getUsuario.idTipoUsuario}");
        Get.offNamed(AppRoutes.HOME, arguments: token);
      } else {
        Get.dialog(AlertDialog(
          title: Text("Error"),
          content: Text("User vacio"),
          actions: [
            FlatButton( 
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ],
        ));
      } */

      /*  Get.dialog(AlertDialog(
        title: Text("Token creado"),
        content: Text(token.token),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok"))
        ],
      )); */
    } catch (e) {
      print(e);
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }
      Get.dialog(AlertDialog(
        title: Text("Error De"),
        content: Text(e.toString()),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok"))
        ],
      ));
    }
  }
}

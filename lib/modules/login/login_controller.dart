import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/local/local_auth_repository.dart';
import 'package:itsuit/data/repositories/remote/auth_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class LoginController extends GetxController {
  String _username = "", _password = "";
  RequestToken token2;

  final AuthRepository _authRepository = Get.find<AuthRepository>();

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  void onUserNamechanged(String text) {
    _username = text;
  }

  void onPasswordchanged(String text) {
    _password = text;
  }

  Future<void> submit() async {
    try {
      final RequestToken token = await _authRepository.authWithLogin(
          username: _username, password: _password);
      await _localAuthRepository.setSession(token);
      Get.offNamed(AppRoutes.HOME, arguments: token);
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
        content: Text(message.toString()),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok"))
        ],
      ));
      return null;
    }
  }

  goToSignUp() {
    Get.offNamed(AppRoutes.SIGNUOP);
  }
}

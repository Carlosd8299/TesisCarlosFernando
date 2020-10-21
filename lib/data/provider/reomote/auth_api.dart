import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';

class AuthApi {
  final Dio _dio = Get.find<Dio>();

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
      print(response.data);
      print(response.data['usuario']);
      return RequestToken.fromJson(response.data);
    } catch (e) {
      printError();
    }
  }
}

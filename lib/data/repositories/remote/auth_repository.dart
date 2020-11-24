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
      
}

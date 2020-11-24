import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/provider/reomote/auth_api.dart';
import 'package:itsuit/data/provider/reomote/api.dart';
import 'package:itsuit/data/repositories/local/local_auth_repository.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/data/repositories/remote/auth_repository.dart';

class DependencyInjection {
  static void init() {
    Get.put(Dio(BaseOptions(baseUrl: "http://23.21.130.107/api/")));
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    //Providers
    Get.put<AuthApi>(AuthApi());
    Get.put<LocalAuth>(LocalAuth());
    Get.put<Apis>(Apis());
    //repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<ApiRepository>(ApiRepository());
    //
  }
}

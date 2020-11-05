import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestToken requestToken) =>
      _localAuth.setSession(requestToken);

  Future<void> clearSession() => _localAuth.clearSession();

  // Future<RequestToken> get session => _localAuth.getSession();
}

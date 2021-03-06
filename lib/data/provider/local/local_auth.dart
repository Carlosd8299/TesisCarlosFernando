import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/routes/my_routes.dart';

class LocalAuth {
  static const KEY = "session";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(RequestToken requestToken) async {
    await _storage.write(key: KEY, value: jsonEncode(requestToken.toJson()));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<RequestToken> getSession() async {
    try {
      final String data = await _storage.read(key: KEY);
      if (data != null) {
        final RequestToken requestToken =
            RequestToken.fromJson(jsonDecode(data));
        final String token = requestToken.token;
        final parts = token.split('.');
        final payload = json
            .decode(ascii.decode(base64.decode(base64.normalize(parts[1]))));
        if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
            .isAfter(DateTime.now())) {
          return requestToken;
        } else {
          Get.offNamed(AppRoutes.LOGIN);
          return null;
        }
      }
      return null;
    } catch (err) {
      return null;
    }
  }
}

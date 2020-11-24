import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itsuit/data/models/request_token.dart';

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
    final String data = await _storage.read(key: KEY);

    if (data != null) {
      final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data));
      DateFormat format = new DateFormat("YYYY/MM/DD HH:MM:SS");
      DateTime fecha = format.parse(requestToken.fechaExpira);
      if (DateTime.now().isBefore(fecha)) {
        return requestToken;
      }
      return null;
    }
    return null;
  }
}

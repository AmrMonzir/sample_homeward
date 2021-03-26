import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageController extends GetxService {
  var storage = new FlutterSecureStorage();

  String token = "";

  Future<String> getToken() async {
    if (token == "") token = (await storage.read(key: "token"))!;
    return token;
  }

  Future<void> deleteToken() async {
    return await storage.delete(key: "token");
  }

  Future<void> setToken({required String? token}) async {
    this.token = token!;
    return await storage.write(key: "token", value: token);
  }
}

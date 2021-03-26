import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_homeward/data/provider/api.dart';
import 'package:http/http.dart' as http;
import 'package:sample_homeward/routes/pages.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;

  Future<void> login() async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    if (email.value == "" && password.value == "") return;
    BlogsApiClient apiClient = BlogsApiClient(client: new http.Client());
    var loginResult = await apiClient.login(email.value, password.value);
    if (loginResult) {
      Get.back();
      Get.offAllNamed(Routes.BLOGSLIST);
    } else {
      Get.snackbar("Error", "Error in login",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}

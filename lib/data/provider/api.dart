import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_homeward/data/model/blog.dart';
import 'package:sample_homeward/data/services/secure_storage.dart';

const baseUrl = 'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/';

class BlogsApiClient extends GetConnect {
  final http.Client client;

  BlogsApiClient({required this.client});

  Future<List<Blog>?> getAll() async {
    var token = await Get.find<SecureStorageController>().getToken();
    try {
      var uri = Uri.parse(baseUrl + "blogs");
      var response = await client.get(uri, headers: {
        'Authorization': token,
      });
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<Blog> blogList =
            jsonResponse.map((model) => Blog.fromJson(model)).toList();
        return blogList;
      } else {
        print("response error = ${response.statusCode}");
        return null;
      }
    } catch (_) {
      print("error = $_");
      return [];
    }
  }

  Future<Blog?> getId(id) async {
    var token = await Get.find<SecureStorageController>().getToken();
    try {
      var uri = Uri.parse(baseUrl + "blogs/$id");
      var response = await client.get(uri, headers: {
        'Authorization': token,
      });
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonResponse = json.decode(response.body);
        Blog blog = Blog.fromJson(json.decode(response.body));
        return blog;
      } else {
        print('erro -get');
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<bool> login(String userName, String password) async {
    try {
      var uri = Uri.parse(baseUrl + "login");
      var response = await client.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "user_name": userName,
            "password": password,
          }));
      print(response.body);
      String token = jsonDecode(response.body)["token"];
      Get.find<SecureStorageController>().setToken(token: token);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sample_homeward/data/provider/api.dart';
import 'package:sample_homeward/data/repository/blog_repo.dart';
import 'package:sample_homeward/data/services/secure_storage.dart';
import 'package:sample_homeward/modules/blogs/blogs_controller.dart';
import 'package:sample_homeward/modules/login/login_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecureStorageController>((){
      return SecureStorageController();
    });
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
    Get.lazyPut<BlogsController>(() {
      return BlogsController(
          repository:
              BlogsRepository(apiClient: BlogsApiClient(client: http.Client())));
    });
  }
}
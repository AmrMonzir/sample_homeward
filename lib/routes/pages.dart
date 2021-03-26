import 'package:get/get.dart';
import 'package:sample_homeward/modules/app_binding.dart';
import 'package:sample_homeward/modules/blogs/blogs_list.dart';
import 'package:sample_homeward/modules/login/login.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: AppBinding()),
    GetPage(name: Routes.BLOGSLIST, page: () => BlogsListPage()),
  ];
}

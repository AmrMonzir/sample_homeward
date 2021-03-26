import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:sample_homeward/data/model/blog.dart';
import 'package:sample_homeward/data/provider/api.dart';
import 'package:sample_homeward/data/repository/blog_repo.dart';
import 'package:http/http.dart' as http;
import 'package:sample_homeward/modules/single_blog/single_blog.dart';
import 'package:sample_homeward/modules/single_blog/single_blog_controller.dart';

class BlogsController extends GetxController {
  final BlogsRepository repository;
  BlogsController({@required this.repository}) : assert(repository != null);

  final blogList = <Blog>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBlogs();
  }

  Future<void> getBlogs() async {
    blogList.addAll(await repository.getAll());
  }

  onBlogClicked(Blog blog) {
    Get.lazyPut<SingleBlogController>(() {
      return SingleBlogController(
          repository: BlogsRepository(
              apiClient: BlogsApiClient(client: http.Client())));
    });
    Get.to(() => SingleBlogPage(id: blog.id));
  }
}

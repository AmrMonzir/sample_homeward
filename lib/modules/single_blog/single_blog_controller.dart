import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:sample_homeward/data/model/blog.dart';
import 'package:sample_homeward/data/repository/blog_repo.dart';

class SingleBlogController extends GetxController {
  final BlogsRepository repository;
  SingleBlogController({@required this.repository})
      : assert(repository != null);

  Blog blog;
  var isDoneLoading = false.obs;

  Future<void> getBlog(id) async {
    //Should always have this blog from prev page and should never have to request it
    //But the requirement says that I should request it, so I request it here.
    blog = await repository.getId(id: id);
    isDoneLoading(true);
    return;
  }
}

import 'package:sample_homeward/data/model/blog.dart';
import 'package:sample_homeward/data/provider/api.dart';

class BlogsRepository {
  final BlogsApiClient apiClient;

  BlogsRepository({required this.apiClient});

  Future<List<Blog>?> getAll() {
    return apiClient.getAll();
  }

  Future<Blog?> getId({String? id}) {
    return apiClient.getId(id);
  }
}

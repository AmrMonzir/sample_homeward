import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_homeward/global_widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';
import 'blogs_controller.dart';

class BlogsListPage extends GetView<BlogsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BlogsListPage'), automaticallyImplyLeading: false),
      body: Obx(
        () => controller.blogList.length < 1
            ? Shimmer.fromColors(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: ListTile(
                      leading: ShimmerContainer(height: 50, width: 50),
                      title: ShimmerContainer(height: 20, width: 150),
                      subtitle: ShimmerContainer(height: 10, width: 70),
                    ),
                  ),
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
              )
            : ListView.builder(
                itemCount: controller.blogList.length,
                itemBuilder: (context, index) {
                  var blog = controller.blogList[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: blog.imageUrl,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: ShimmerContainer(height: 50, width: 50),
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                      ),
                    ),
                    title: Text(blog.title),
                    subtitle: Text(blog.createdAt.toString()),
                    onTap: () => controller.onBlogClicked(blog),
                  );
                },
              ),
      ),
    );
  }
}

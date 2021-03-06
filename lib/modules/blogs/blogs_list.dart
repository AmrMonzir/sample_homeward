import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_homeward/global_widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';
import 'blogs_controller.dart';
import 'package:sample_homeward/utils/constants.dart';

class BlogsListPage extends GetView<BlogsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Blogs List Page'), automaticallyImplyLeading: false),
      body: Obx(
        () => controller.blogList.length < 1
            ? Shimmer.fromColors(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: kBaseShimmerColor,
                    highlightColor: kHighlightShimmerColor,
                    child: ListTile(
                      leading: ShimmerContainer(height: 50, width: 50),
                      title: ShimmerContainer(height: 20, width: 150),
                      subtitle: ShimmerContainer(height: 10, width: 70),
                    ),
                  ),
                ),
                baseColor: kBaseShimmerColor,
                highlightColor: kHighlightShimmerColor,
              )
            : ListView.builder(
                itemCount: controller.blogList.length,
                itemBuilder: (context, index) {
                  var blog = controller.blogList[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: blog.imageUrl!,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: ShimmerContainer(height: 50, width: 50),
                        baseColor: kBaseShimmerColor,
                        highlightColor: kHighlightShimmerColor,
                      ),
                    ),
                    title: Text(blog.title!),
                    subtitle: Text(blog.createdAt.toString()),
                    onTap: () => controller.onBlogClicked(blog),
                  );
                },
              ),
      ),
    );
  }
}

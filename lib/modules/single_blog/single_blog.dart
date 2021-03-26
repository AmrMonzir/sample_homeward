import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_homeward/global_widgets/shimmer_container.dart';
import 'package:sample_homeward/modules/single_blog/single_blog_controller.dart';
import 'package:shimmer/shimmer.dart';

class SingleBlogPage extends GetView<SingleBlogController> {
  final String id;

  const SingleBlogPage({@required this.id});

  @override
  Widget build(BuildContext context) {
    Get.find<SingleBlogController>().getBlog(id);

    return Scaffold(
        appBar: AppBar(title: Text('SingleBlogPage')),
        body: Center(
          child: Obx(() {
            return controller.isDoneLoading.value
                ? Column(
                    children: [
                      InteractiveViewer(
                        child: CachedNetworkImage(
                          imageUrl: controller.blog.imageUrl,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          placeholder: (context, url) => Shimmer.fromColors(
                            child: ShimmerContainer(height: 250, width: 250),
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("${controller.blog.title}",
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 16),
                      Text("${controller.blog.createdAt.toString()}"),
                    ],
                  )
                : Center(child: CircularProgressIndicator());
          }),
        ));
  }
}

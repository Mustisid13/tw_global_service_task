import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global_service_task/features/homepage/view/controller/HomePageController.dart';

class FullImageView extends GetView<HomeController> {
  const FullImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Opacity(
        opacity: 0.7,
        child: FloatingActionButton(
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Hero(
        tag: "${controller.imageUrl!}hero",
        child: Center(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: controller.imageUrl ?? "",
            errorWidget: (context, url, error) {
              return const Icon(
                Icons.error,
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}

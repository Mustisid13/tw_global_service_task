import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tw_global_service_task/core/router/AppRouterName.dart';
import 'package:tw_global_service_task/features/homepage/domain/models/PixabayImagesResponseModel.dart';
import 'package:tw_global_service_task/features/homepage/view/controller/HomePageController.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({super.key, required this.imageData});
  final ImagesData? imageData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().imageUrl = imageData?.fullHDURL;
        Get.toNamed(AppRouterName.fullImage);
      },
      child: Container(
        height: 250,
        width: 250,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Hero(
                tag: "${imageData?.fullHDURL!}hero",
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageData?.webformatURL ?? "",
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DataContainer(
                  data: imageData?.likes?.toString(),
                  icon: Icons.favorite,
                ),
                _DataContainer(
                  icon: Icons.remove_red_eye_rounded,
                  data: imageData?.views?.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DataContainer extends StatelessWidget {
  const _DataContainer({super.key, required this.data, required this.icon});
  final String? data;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 4),
            Text(data ?? "0")
          ],
        ),
      ),
    );
  }
}

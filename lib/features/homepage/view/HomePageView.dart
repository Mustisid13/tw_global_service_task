import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:tw_global_service_task/features/homepage/view/controller/HomePageController.dart';
import 'package:tw_global_service_task/features/homepage/view/widgets/ImageTile.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Obx(
              () => Positioned(
                bottom: 0,
                child: Visibility(
                  visible: controller.isPaginationLoading.value,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
            GetBuilder<HomeController>(
                init: controller,
                builder: (controller) => GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: controller.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _calculateCrossAxisCount(context),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: controller.imagesResponseModel.value
                          .length, // Change this according to your image count
                      itemBuilder: (context, index) {
                        return ImageTile(
                          imageData: controller.imagesResponseModel[index],
                        );
                      },
                    )
                // Wrap(
                //   alignment: WrapAlignment.center,
                //   spacing: 20,
                //   runSpacing: 20,

                //   children: List.generate(
                //       controller.imagesResponseModel.length,
                //       (index) => ImageTile(
                //             imageData:
                //                 controller.imagesResponseModel[index],
                //           )),
                // ),
                ),
          ],
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth ~/ 250; // Adjust 200 according to image size
    return crossAxisCount;
  }
}

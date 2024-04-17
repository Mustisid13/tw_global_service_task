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
            Center(
              child: Scrollbar(
                trackVisibility: true,
                interactive: true,
                controller: controller.scrollController,
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller.scrollController,
                  child: GetBuilder<HomeController>(
                    init: controller,
                    builder: (controller) => Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(
                          controller.imagesResponseModel.length,
                          (index) => ImageTile(
                                imageData:
                                    controller.imagesResponseModel[index],
                              )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

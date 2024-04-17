import 'package:get/get.dart';
import 'package:tw_global_service_task/core/network/NetworkHandler.dart';
import 'package:tw_global_service_task/features/homepage/domain/HomeRepositoryImpl.dart';
import 'package:tw_global_service_task/features/homepage/domain/usecases/HomePageUsecase.dart';
import 'package:tw_global_service_task/features/homepage/repository/HomeRepository.dart';

import 'HomePageController.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(networkHandler: Get.find<NetworkHandler>()));
    Get.lazyPut(() => HomePageUsecase(repository: Get.find<HomeRepository>()));
    Get.lazyPut<HomeController>(
        () => HomeController(usecase: Get.find<HomePageUsecase>()));
  }
}

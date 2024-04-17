import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tw_global_service_task/core/network/NetworkHandler.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkHandler(dio: Dio()));
  }
}

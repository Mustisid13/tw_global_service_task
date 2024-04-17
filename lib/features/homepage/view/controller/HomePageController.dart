import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global_service_task/features/homepage/domain/models/PixabayImagesResponseModel.dart';
import 'package:tw_global_service_task/features/homepage/domain/usecases/HomePageUsecase.dart';

class HomeController extends GetxController {
  late final HomePageUsecase _usecase;
  HomeController({required HomePageUsecase usecase}) {
    _usecase = usecase;
  }
  String? imageUrl;
  late ScrollController scrollController;
  RxList<ImagesData> imagesResponseModel =
      <ImagesData>[].obs; // stores images list
  RxBool isLoading = false.obs; // page loader flag
  RxBool isPaginationLoading = false.obs; // pagination loader flag
  int _page = 0; // maintain page number for pagination
  final int _limit = 30; // maintain page limit for pagination

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    _getImageList();
  }

  void _scrollListener() {
    // checking if we are on end of scroll
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      // Reach the end of the list
      _getImageList();
    }
  }

  /// _getImageList fetches the images from Pixabay API
  Future<void> _getImageList() async {
    // incrementing the page number
    _page++;
    // if we are on 1st page then the page loader will be shown
    if (_page == 1) {
      isLoading.value = true;
    } else {
      // else we are loading more data when user reaches the end of scroll
      isPaginationLoading.value = true;
    }

    try {
      // fetching the data
      final result = await _usecase
          .getImagesFromPixabay({"page": _page, "per_page": _limit});
      // initializing the image response model with the first set
      if (_page == 1) {
        imagesResponseModel.value = result?.hits ?? [];
        update();
      } else {
        // adding more images to list  in case of pagination
        imagesResponseModel.value.addAll(result?.hits ?? []);
        update();
        log(imagesResponseModel.length.toString());
      }
    } catch (err) {
      log("", error: err.toString(), name: "Pixabay image fetch error");
      // reducing pacge number as we got error on it, so next time when this method is called we will be calling the same number
      _page--;
    } finally {
      // setting all loader to false
      _setLoadersToFalse();
    }
  }

  /// Helper function to set both `isLoading` and `isPaginationLoading` to false.
  void _setLoadersToFalse() {
    // checking if loader is true then setting it to false for avoiding rebuilds
    if (isLoading.value) {
      isLoading.value = false;
    }
    if (isPaginationLoading.value) {
      isPaginationLoading.value = false;
    }
  }
}

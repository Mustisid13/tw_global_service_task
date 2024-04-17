import 'package:tw_global_service_task/features/homepage/domain/models/PixabayImagesResponseModel.dart';
import 'package:tw_global_service_task/features/homepage/repository/HomeRepository.dart';

class HomePageUsecase {
  late final HomeRepository _repository;

  HomePageUsecase({required HomeRepository repository}) {
    _repository = repository;
  }
  Future<PixabayImagesResponseModel?> getImagesFromPixabay(
      Map<String, dynamic> queryParameters) async {
    Map<String, dynamic> qParams = queryParameters;
    PixabayImagesResponseModel? dataModel;
    qParams["key"] = "43430826-6ca55953a13b29b7215b41c09";

    final result = await _repository.getImagesFromPixabay(
        "https://pixabay.com/api/",
        queryParameters: qParams);

    result.fold((l) {
      // show snackbar
    }, (r) {
      dataModel = PixabayImagesResponseModel.fromJson(r);
    });

    return dataModel;
  }
}

import 'package:dartz/dartz.dart';
import 'package:tw_global_service_task/core/network/NetworkHandler.dart';
import 'package:tw_global_service_task/core/network/models/ErrorModel.dart';
import 'package:tw_global_service_task/features/homepage/repository/HomeRepository.dart';

class HomeRepositoryImpl extends HomeRepository {
  late final NetworkHandler _networkHandler;
  HomeRepositoryImpl({required NetworkHandler networkHandler}) {
    _networkHandler = networkHandler;
  }
  @override
  Future<Either<ErrorModel, Map<String, dynamic>>> getImagesFromPixabay(
      String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _networkHandler.getRequest(url,
        queryParameters: queryParameters);
  }
}

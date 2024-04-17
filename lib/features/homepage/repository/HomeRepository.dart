import 'package:dartz/dartz.dart';
import 'package:tw_global_service_task/core/network/models/ErrorModel.dart';

abstract class HomeRepository {
  Future<Either<ErrorModel, Map<String, dynamic>>> getImagesFromPixabay(
      String url,
      {Map<String, dynamic>? queryParameters});
}

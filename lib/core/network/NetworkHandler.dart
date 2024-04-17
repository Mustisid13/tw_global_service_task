import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tw_global_service_task/core/network/models/ErrorModel.dart';

class NetworkHandler {
  late final Dio _dio;
  NetworkHandler({required Dio dio}) {
    _dio = dio;
  }

  Future<Either<ErrorModel, Map<String, dynamic>>> getRequest(String url,
      {Map<String, dynamic>? queryParameters}) async {
        
    Response response = await _dio.get(url, queryParameters: queryParameters);
    if (response.statusCode! < 200 || response.statusCode! > 400) {
      return Left(ErrorModel(
          statusCode: response.statusCode, error: response.data.toString()));
    } else {
      return Right(response.data as Map<String, dynamic>);
    }
  }
}

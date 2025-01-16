import "package:dartz/dartz.dart";
import "package:dio/dio.dart";
import "package:flutter_data_caching_example/core/constants/api_urls.dart";
import "package:flutter_data_caching_example/core/network/dio_client.dart";
import "package:flutter_data_caching_example/servie_locator.dart";

abstract class ProductApiServices {
  Future<Either> getProducts();
}

class ProductApiServicesImpl extends ProductApiServices {
  @override
  Future<Either> getProducts() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getProducts);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['detail']);
    }
  }
}

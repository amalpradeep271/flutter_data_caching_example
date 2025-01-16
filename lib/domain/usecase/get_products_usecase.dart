import 'package:dartz/dartz.dart';
import 'package:flutter_data_caching_example/core/usecase/usecase.dart';
import 'package:flutter_data_caching_example/domain/repository/product_repository.dart';
import 'package:flutter_data_caching_example/servie_locator.dart';

class GetProductsUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getProducts();
  }
}

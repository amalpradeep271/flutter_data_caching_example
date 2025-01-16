import 'package:flutter_data_caching_example/core/usecase/usecase.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';
import 'package:flutter_data_caching_example/domain/repository/product_repository.dart';
import 'package:flutter_data_caching_example/servie_locator.dart';

class GetHiveProductsUsecase extends UseCase<List<ProductEntity>, dynamic> {
  @override
  Future<List<ProductEntity>> call({params}) async {
    return await sl<ProductRepository>().getLocalProducts();
  }
}

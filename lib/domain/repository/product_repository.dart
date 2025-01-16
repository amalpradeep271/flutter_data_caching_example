import 'package:dartz/dartz.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either> getProducts();
  Future<List<ProductEntity>> getLocalProducts();
}

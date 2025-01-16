import 'package:dartz/dartz.dart';
import 'package:flutter_data_caching_example/common/helpers/mappers/product_mapper.dart';
import 'package:flutter_data_caching_example/data/model/product_model.dart';
import 'package:flutter_data_caching_example/data/sources/product_api_services.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';
import 'package:flutter_data_caching_example/domain/repository/product_repository.dart';
import 'package:flutter_data_caching_example/servie_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductRepositoryImpl extends ProductRepository {
  final Box<ProductEntity> _productsBox = Hive.box<ProductEntity>('productBox');

  @override
  Future<Either> getProducts() async {
    try {
      var returnedData = await sl<ProductApiServices>().getProducts();
      return returnedData.fold(
        (error) async {
          if (_productsBox.isNotEmpty) {
            final cachedProducts = _productsBox.values.toList();
            return Right(cachedProducts);
          } else {
            return Left(error);
          }
        },
        (data) async {
          var products = List.from(data['products'])
              .map(
                  (item) => ProductMapper.toEntity(ProductModel.fromJson(item)))
              .toList();
          // Save to Hive
          await _productsBox.clear();
          await _productsBox.addAll(products);
          return Right(products);
        },
      );
    } catch (e) {
    
      return const Left('Error fetching data');
    }
  }

   Future<List<ProductEntity>> getLocalProducts() async {
    return _productsBox.values.toList();
  }
}

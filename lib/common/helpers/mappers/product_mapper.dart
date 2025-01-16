import 'package:flutter_data_caching_example/data/model/product_model.dart';
import 'package:flutter_data_caching_example/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity toEntity(ProductModel product) {
    return ProductEntity(
      id: product.id,
      price: product.price,
      category: product.category,
      updatedAt: product.updatedAt,
      photoUrl: product.photoUrl,
      name: product.name,
      description: product.description,
      createdAt: product.createdAt,
    );
  }
}

import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final double? price;

  @HiveField(2)
  final String? category;

  @HiveField(3)
  final DateTime? updatedAt;

  @HiveField(4)
  final String? photoUrl;

  @HiveField(5)
  final String? name;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final DateTime? createdAt;

  ProductEntity({
    required this.id,
    required this.price,
    required this.category,
    required this.updatedAt,
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.createdAt,
  });
}

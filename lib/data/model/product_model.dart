
class ProductModel  {
  final int? id;
  final double? price;
  final String? category;
  final DateTime? updatedAt;
  final String? photoUrl;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  ProductModel({
    required this.id,
    required this.price,
    required this.category,
    required this.updatedAt,
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      price: json["price"],
      category: json["category"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      photoUrl: json["photo_url"],
      name: json["name"],
      description: json["description"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}

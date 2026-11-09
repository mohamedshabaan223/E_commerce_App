class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.coverPictureUrl,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    required this.stock,
  });

  final String id;
  final String name;
  final String coverPictureUrl;
  final double price;
  final int discountPercentage;
  final double rating;
  final int reviewsCount;
  final int stock;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    coverPictureUrl: json['coverPictureUrl']?.toString().trim() ?? '',
    price: (json['price'] ?? 0).toDouble(),
    discountPercentage: (json['discountPercentage'] ?? 0).toInt(),
    rating: (json['rating'] ?? 0).toDouble(),
    reviewsCount: (json['reviewsCount'] ?? 0).toInt(),
    stock: (json['stock'] ?? 0).toInt(),
  );
}

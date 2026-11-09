class ProductDetailsModel {
  const ProductDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.discountPercentage,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
  });

  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final List<String> productPictures;
  final double price;
  final int discountPercentage;
  final int stock;
  final double weight;
  final String color;
  final double rating;
  final int reviewsCount;

  bool get hasDiscount => discountPercentage > 0;

  double get finalPrice => price * (100 - discountPercentage) / 100;

  List<String> get images =>
      productPictures.isEmpty ? [coverPictureUrl] : productPictures;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: '${json['id'] ?? ''}',
      name: '${json['name'] ?? ''}',
      description: '${json['description'] ?? ''}',
      coverPictureUrl: '${json['coverPictureUrl'] ?? ''}',
      productPictures: (json['productPictures'] as List? ?? [])
          .map((image) => image.toString())
          .toList(),
      price: double.tryParse('${json['price'] ?? 0}') ?? 0,
      discountPercentage:
          int.tryParse('${json['discountPercentage'] ?? 0}') ?? 0,
      stock: int.tryParse('${json['stock'] ?? 0}') ?? 0,
      weight: double.tryParse('${json['weight'] ?? 0}') ?? 0,
      color: '${json['color'] ?? ''}',
      rating: double.tryParse('${json['rating'] ?? 0}') ?? 0,
      reviewsCount: int.tryParse('${json['reviewsCount'] ?? 0}') ?? 0,
    );
  }
}

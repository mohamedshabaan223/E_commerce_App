class ProductModel {
  String? id;
  final String sellerId;
  final String name;
  final String description;
  final String nameArabic;
  final String descriptionArabic;
  final String coverPictureUrl;
  final double price;
  final int stock;
  final double weight;
  final String color;
  final int discountPercentage;
  final List<String> categoryIds;
  final List<String> productPictureUrls;

  ProductModel({
    this.id,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.nameArabic,
    required this.descriptionArabic,
    required this.coverPictureUrl,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.categoryIds,
    required this.productPictureUrls,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerId": sellerId,
      "name": name,
      "description": description,
      "nameArabic": nameArabic,
      "descriptionArabic": descriptionArabic,
      "coverPictureUrl": coverPictureUrl,
      "price": price,
      "stock": stock,
      "weight": weight,
      "color": color,
      "discountPercentage": discountPercentage,
      "categoryIds": categoryIds,
      "productPictureUrls": productPictureUrls,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString(),
      sellerId: json['sellerId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      nameArabic: json['arabicName']?.toString() ?? '',
      descriptionArabic: json['arabicDescription']?.toString() ?? '',
      coverPictureUrl: json['coverPictureUrl']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      color: json['color']?.toString() ?? '',
      discountPercentage: (json['discountPercentage'] as num?)?.toInt() ?? 0,
      categoryIds: [],
      productPictureUrls: [],
    );
  }
}

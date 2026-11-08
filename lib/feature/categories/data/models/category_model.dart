class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    description: json['description']?.toString() ?? '',
    coverPictureUrl: json['coverPictureUrl']?.toString().trim() ?? '',
  );
}

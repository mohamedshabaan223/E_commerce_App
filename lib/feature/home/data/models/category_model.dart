class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.coverPictureUrl,
  });

  final String id;
  final String name;
  final String coverPictureUrl;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    coverPictureUrl: json['coverPictureUrl']?.toString().trim() ?? '',
  );
}

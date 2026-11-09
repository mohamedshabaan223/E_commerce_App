class OfferModel {
  const OfferModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverUrl,
  });

  final String id;
  final String name;
  final String description;
  final String coverUrl;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    description: json['description']?.toString() ?? '',
    coverUrl: json['coverUrl']?.toString().trim() ?? '',
  );
}

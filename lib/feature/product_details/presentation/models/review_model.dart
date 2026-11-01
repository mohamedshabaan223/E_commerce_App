class ReviewModel {
  const ReviewModel({
    required this.name,
    required this.initials,
    required this.date,
    required this.rating,
    required this.comment,
  });

  final String name;
  final String initials;
  final String date;
  final double rating;
  final String comment;
}

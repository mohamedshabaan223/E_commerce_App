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

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final name = _firstString(json, [
      'userName',
      'userFullName',
      'reviewerName',
      'customerName',
      'fullName',
      'name',
    ]);
    final displayName = name.isEmpty ? 'Anonymous' : name;

    return ReviewModel(
      name: displayName,
      initials: _initials(displayName),
      date: _formatDate(
        _firstString(json, [
          'createdAtUtc',
          'createdAt',
          'createdOn',
          'date',
        ]),
      ),
      rating: double.tryParse('${json['rating'] ?? json['stars'] ?? 0}') ?? 0,
      comment: _firstString(json, ['comment', 'content', 'text', 'body']),
    );
  }

  static String _firstString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value != null && '$value'.trim().isNotEmpty) return '$value'.trim();
    }
    return '';
  }

  static String _initials(String name) {
    final parts = name.split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    if (parts.isEmpty) return '?';
    final list = parts.toList();
    if (list.length == 1) return list.first[0].toUpperCase();
    return (list.first[0] + list.last[0]).toUpperCase();
  }

  static String _formatDate(String raw) {
    final date = DateTime.tryParse(raw)?.toLocal();
    if (date == null) return raw;
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

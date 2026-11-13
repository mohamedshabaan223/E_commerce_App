class UserModel {
  final String fullName;
  final String email;

  const UserModel({required this.fullName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
    );
  }

  String get initials {
    final words = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) return '?';
    final second = words.length > 1 ? words[1][0] : '';
    return (words.first[0] + second).toUpperCase();
  }
}

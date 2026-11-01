class NotificationModel {
  final String time;
  final String prefix;
  final String? highlight;
  final bool highlightIsGold;
  final String suffix;
  final bool isRead;

  const NotificationModel({
    required this.time,
    this.prefix = '',
    this.highlight,
    this.highlightIsGold = false,
    this.suffix = '',
    this.isRead = false,
  });

  NotificationModel copyWith({bool? isRead}) => NotificationModel(
        time: time,
        prefix: prefix,
        highlight: highlight,
        highlightIsGold: highlightIsGold,
        suffix: suffix,
        isRead: isRead ?? this.isRead,
      );
}

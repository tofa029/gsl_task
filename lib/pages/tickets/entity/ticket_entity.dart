///TicketEntity to convert api json data to dart vars
///
class TicketEntity {
  final int id;
  final String status;
  final String priority;
  final String title;
  final String user;
  final String timestamp;
  final List<String> tags;

  TicketEntity({
    required this.id,
    required this.status,
    required this.priority,
    required this.title,
    required this.user,
    required this.timestamp,
    required this.tags,
  });

  factory TicketEntity.fromJson(Map<String, dynamic> json) {
    return TicketEntity(
      id: json['id'],
      status: json['status'],
      priority: json['priority'],
      title: json['title'],
      user: json['user'],
      timestamp: json['timestamp'],
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'priority': priority,
      'title': title,
      'user': user,
      'timestamp': timestamp,
      'tags': tags,
    };
  }
}

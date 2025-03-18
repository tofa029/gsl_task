///TicketEntity to convert api json data to dart vars
///
class TicketEntity {
  final int id;
  final String status;
  final int statusId;
  final String priority;
  final int priorityId;
  final String title;
  final String user;
  final String timestamp;
  final List<String> tags;

  TicketEntity({
    required this.id,
    required this.status,
    required this.statusId,
    required this.priority,
    required this.priorityId,
    required this.title,
    required this.user,
    required this.timestamp,
    required this.tags,
  });

  factory TicketEntity.fromJson(Map<String, dynamic> json) {
    return TicketEntity(
      id: json['id'],
      status: json['status'],
      statusId: json['status_id'],
      priority: json['priority'],
      priorityId: json['priority_id'],
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
      'status_id': statusId,
      'priority': priority,
      'priority_id': priorityId,
      'title': title,
      'user': user,
      'timestamp': timestamp,
      'tags': tags,
    };
  }
}



class NotificationModel {
  final String? id;
  final String? message;
  final String? role;
  final String? type;
  final bool? viewStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationModel({
    this.id,
    this.message,
    this.role,
    this.type,
    this.viewStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["_id"],
    message: json["message"],
    role: json["role"],
    type: json["type"],
    viewStatus: json["viewStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "message": message,
    "role": role,
    "type": type,
    "viewStatus": viewStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

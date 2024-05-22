

class SubscriptionModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? price;
  final int? duration;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  SubscriptionModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.duration,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    price: json["price"],
    duration: json["duration"],
    type: json["type"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "price": price,
    "duration": duration,
    "type": type,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}



class MyCompleteMatchModel {
  final String? id;
  final String? matchName;
  final String? createdBy;
  final String? description;
  final String? eventId;
  final EventDetails? eventDetails;
  final String? registrationStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MyCompleteMatchModel({
    this.id,
    this.matchName,
    this.createdBy,
    this.description,
    this.eventId,
    this.eventDetails,
    this.registrationStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyCompleteMatchModel.fromJson(Map<String, dynamic> json) => MyCompleteMatchModel(
    id: json["_id"],
    matchName: json["matchName"],
    createdBy: json["createdBy"],
    description: json["description"],
    eventId: json["eventId"],
    eventDetails: json["eventDetails"] == null ? null : EventDetails.fromJson(json["eventDetails"]),
    registrationStatus: json["registrationStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "matchName": matchName,
    "createdBy": createdBy,
    "description": description,
    "eventId": eventId,
    "eventDetails": eventDetails?.toJson(),
    "registrationStatus": registrationStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class EventDetails {
  final String? id;
  final String? eventName;
  final String? location;
  final String? eventTime;
  final String? fee;
  final DateTime? closeDate;
  final DateTime? eventDate;
  final String? description;
  final List<Match>? matches;
  final Image? image;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  EventDetails({
    this.id,
    this.eventName,
    this.location,
    this.eventTime,
    this.fee,
    this.closeDate,
    this.eventDate,
    this.description,
    this.matches,
    this.image,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) => EventDetails(
    id: json["_id"],
    eventName: json["eventName"],
    location: json["location"],
    eventTime: json["eventTime"],
    fee: json["fee"],
    closeDate: json["closeDate"] == null ? null : DateTime.parse(json["closeDate"]),
    eventDate: json["eventDate"] == null ? null : DateTime.parse(json["eventDate"]),
    description: json["description"],
    matches: json["matches"] == null ? [] : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "eventName": eventName,
    "location": location,
    "eventTime": eventTime,
    "fee": fee,
    "closeDate": closeDate?.toIso8601String(),
    "eventDate": eventDate?.toIso8601String(),
    "description": description,
    "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
    "image": image?.toJson(),
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Image {
  final dynamic path;
  final String? publicFileUrl;

  Image({
    this.path,
    this.publicFileUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    path: json["path"],
    publicFileUrl: json["publicFileURL"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "publicFileURL": publicFileUrl,
  };
}

class Match {
  final String? matchName;
  final String? description;

  Match({
    this.matchName,
    this.description,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    matchName: json["matchName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "matchName": matchName,
    "description": description,
  };
}

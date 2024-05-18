

class MyUpComingEventsModel {
  final String? id;
  final String? fullName;
  final String? email;
  final DateTime? phone;
  final String? gender;
  final int? age;
  final String? shoulder;
  final String? clubName;
  final String? className;
  final Event? event;
  final List<MyUpComingEventsModelMatch>? matches;
  final String? sharingRifle;
  final String? user;
  final String? eventRegisterStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MyUpComingEventsModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.age,
    this.shoulder,
    this.clubName,
    this.className,
    this.event,
    this.matches,
    this.sharingRifle,
    this.user,
    this.eventRegisterStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyUpComingEventsModel.fromJson(Map<String, dynamic> json) => MyUpComingEventsModel(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"] == null ? null : DateTime.parse(json["phone"]),
    gender: json["gender"],
    age: json["age"],
    shoulder: json["shoulder"],
    clubName: json["clubName"],
    className: json["className"],
    event: json["event"] == null ? null : Event.fromJson(json["event"]),
    matches: json["matches"] == null ? [] : List<MyUpComingEventsModelMatch>.from(json["matches"]!.map((x) => MyUpComingEventsModelMatch.fromJson(x))),
    sharingRifle: json["sharingRifle"],
    user: json["user"],
    eventRegisterStatus: json["eventRegisterStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phone": phone?.toIso8601String(),
    "gender": gender,
    "age": age,
    "shoulder": shoulder,
    "clubName": clubName,
    "className": className,
    "event": event?.toJson(),
    "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
    "sharingRifle": sharingRifle,
    "user": user,
    "eventRegisterStatus": eventRegisterStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Event {
  final String? id;
  final String? eventName;
  final String? location;
  final String? eventTime;
  final String? fee;
  final DateTime? closeDate;
  final DateTime? eventDate;
  final String? description;
  final List<EventMatch>? matches;
  final Image? image;
  final String? registrationStatus;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Event({
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
    this.registrationStatus,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["_id"],
    eventName: json["eventName"],
    location: json["location"],
    eventTime: json["eventTime"],
    fee: json["fee"],
    closeDate: json["closeDate"] == null ? null : DateTime.parse(json["closeDate"]),
    eventDate: json["eventDate"] == null ? null : DateTime.parse(json["eventDate"]),
    description: json["description"],
    matches: json["matches"] == null ? [] : List<EventMatch>.from(json["matches"]!.map((x) => EventMatch.fromJson(x))),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    registrationStatus: json["registrationStatus"],
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
    "registrationStatus": registrationStatus,
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

class EventMatch {
  final String? matchName;
  final String? description;

  EventMatch({
    this.matchName,
    this.description,
  });

  factory EventMatch.fromJson(Map<String, dynamic> json) => EventMatch(
    matchName: json["matchName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "matchName": matchName,
    "description": description,
  };
}

class MyUpComingEventsModelMatch {
  final String? id;
  final String? matchName;
  final String? createdBy;
  final String? description;
  final String? eventId;
  final String? eventDetails;
  final String? registrationStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MyUpComingEventsModelMatch({
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

  factory MyUpComingEventsModelMatch.fromJson(Map<String, dynamic> json) => MyUpComingEventsModelMatch(
    id: json["_id"],
    matchName: json["matchName"],
    createdBy: json["createdBy"],
    description: json["description"],
    eventId: json["eventId"],
    eventDetails: json["eventDetails"],
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
    "eventDetails": eventDetails,
    "registrationStatus": registrationStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  final String? id;
  final String? name;
  final String? location;
  final DateTime? closingDate;
  final DateTime? startedDate;
  final String? description;
  final Image? image;
  final String? createdBy;
  final int? v;

  EventsModel({
    this.id,
    this.name,
    this.location,
    this.closingDate,
    this.startedDate,
    this.description,
    this.image,
    this.createdBy,
    this.v,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    closingDate: json["closingDate"] == null ? null : DateTime.parse(json["closingDate"]),
    startedDate: json["startedDate"] == null ? null : DateTime.parse(json["startedDate"]),
    description: json["description"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    createdBy: json["createdBy"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
    "closingDate": closingDate?.toIso8601String(),
    "startedDate": startedDate?.toIso8601String(),
    "description": description,
    "image": image?.toJson(),
    "createdBy": createdBy,
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

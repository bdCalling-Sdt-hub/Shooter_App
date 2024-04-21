// To parse this JSON data, do
//
//     final upComingEventModel = upComingEventModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UpComingEventModel> upComingEventModelFromJson(String str) => List<UpComingEventModel>.from(json.decode(str).map((x) => UpComingEventModel.fromJson(x)));

String upComingEventModelToJson(List<UpComingEventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpComingEventModel {
  final String id;
  final String name;
  final String location;
  final DateTime closingDate;
  final DateTime startedDate;
  final String description;
  final Image image;
  final String createdBy;
  final int v;

  UpComingEventModel({
    required this.id,
    required this.name,
    required this.location,
    required this.closingDate,
    required this.startedDate,
    required this.description,
    required this.image,
    required this.createdBy,
    required this.v,
  });

  factory UpComingEventModel.fromJson(Map<String, dynamic> json) => UpComingEventModel(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    closingDate: DateTime.parse(json["closingDate"]),
    startedDate: DateTime.parse(json["startedDate"]),
    description: json["description"],
    image: Image.fromJson(json["image"]),
    createdBy: json["createdBy"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
    "closingDate": closingDate.toIso8601String(),
    "startedDate": startedDate.toIso8601String(),
    "description": description,
    "image": image.toJson(),
    "createdBy": createdBy,
    "__v": v,
  };
}

class Image {
  final String fieldname;
  final String originalname;
  final String encoding;
  final String mimetype;
  final String destination;
  final String filename;
  final String path;
  final int size;

  Image({
    required this.fieldname,
    required this.originalname,
    required this.encoding,
    required this.mimetype,
    required this.destination,
    required this.filename,
    required this.path,
    required this.size,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    fieldname: json["fieldname"],
    originalname: json["originalname"],
    encoding: json["encoding"],
    mimetype: json["mimetype"],
    destination: json["destination"],
    filename: json["filename"],
    path: json["path"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "fieldname": fieldname,
    "originalname": originalname,
    "encoding": encoding,
    "mimetype": mimetype,
    "destination": destination,
    "filename": filename,
    "path": path,
    "size": size,
  };
}

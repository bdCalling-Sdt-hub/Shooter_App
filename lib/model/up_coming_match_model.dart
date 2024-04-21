// To parse this JSON data, do
//
//     final upComingMatchModel = upComingMatchModelFromJson(jsonString);

import 'dart:convert';

List<UpComingMatchModel> upComingMatchModelFromJson(String str) => List<UpComingMatchModel>.from(json.decode(str).map((x) => UpComingMatchModel.fromJson(x)));

String upComingMatchModelToJson(List<UpComingMatchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpComingMatchModel {
  final String? id;
  final String? matchName;
  final String? gender;
  final DateTime? matchDate;
  final String? time;
  final String? prone;
  final String? fee;
  final Image? image;
  final String? createdBy;
  final String? event;
  final String? registrationStatus;
  final int? v;

  UpComingMatchModel({
    this.id,
    this.matchName,
    this.gender,
    this.matchDate,
    this.time,
    this.prone,
    this.fee,
    this.image,
    this.createdBy,
    this.event,
    this.registrationStatus,
    this.v,
  });

  factory UpComingMatchModel.fromJson(Map<String, dynamic> json) => UpComingMatchModel(
    id: json["_id"],
    matchName: json["matchName"],
    gender: json["gender"],
    matchDate: json["matchDate"] == null ? null : DateTime.parse(json["matchDate"]),
    time: json["time"],
    prone: json["prone"],
    fee: json["fee"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    createdBy: json["createdBy"],
    event: json["event"],
    registrationStatus: json["registrationStatus"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "matchName": matchName,
    "gender": gender,
    "matchDate": matchDate?.toIso8601String(),
    "time": time,
    "prone": prone,
    "fee": fee,
    "image": image?.toJson(),
    "createdBy": createdBy,
    "event": event,
    "registrationStatus": registrationStatus,
    "__v": v,
  };
}

class Image {
  final String? fieldname;
  final String? originalname;
  final String? encoding;
  final String? mimetype;
  final String? destination;
  final String? filename;
  final String? path;
  final int? size;

  Image({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
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

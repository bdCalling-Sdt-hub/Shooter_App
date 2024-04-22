

class MatchModel {
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

  MatchModel({
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

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
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

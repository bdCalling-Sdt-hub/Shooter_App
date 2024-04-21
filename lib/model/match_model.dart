

class MatchModel {
  final String? message;
  final Data? data;
  final Pagination? pagination;

  MatchModel({
    this.message,
    this.data,
    this.pagination,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class Data {
  final List<Attribute>? attributes;

  Data({
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
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

  Attribute({
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

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
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

class Pagination {
  final int? totalPages;
  final int? currentPage;
  final dynamic prevPage;
  final dynamic nextPage;
  final int? totalMatches;

  Pagination({
    this.totalPages,
    this.currentPage,
    this.prevPage,
    this.nextPage,
    this.totalMatches,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
    totalMatches: json["totalMatches"],
  );

  Map<String, dynamic> toJson() => {
    "totalPages": totalPages,
    "currentPage": currentPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
    "totalMatches": totalMatches,
  };
}

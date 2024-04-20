

class EventsModel {
  final String? message;
  final List<Datum>? data;
  final Pagination? pagination;

  EventsModel({
    this.message,
    this.data,
    this.pagination,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  final String? id;
  final String? name;
  final String? location;
  final DateTime? closingDate;
  final DateTime? startedDate;
  final String? description;
  final String? createdBy;
  final int? v;

  Datum({
    this.id,
    this.name,
    this.location,
    this.closingDate,
    this.startedDate,
    this.description,
    this.createdBy,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    closingDate: json["closingDate"] == null ? null : DateTime.parse(json["closingDate"]),
    startedDate: json["startedDate"] == null ? null : DateTime.parse(json["startedDate"]),
    description: json["description"],
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
    "createdBy": createdBy,
    "__v": v,
  };
}

class Pagination {
  final int? totalPages;
  final int? currentPage;
  final dynamic prevPage;
  final dynamic nextPage;
  final int? totalEvents;

  Pagination({
    this.totalPages,
    this.currentPage,
    this.prevPage,
    this.nextPage,
    this.totalEvents,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
    totalEvents: json["totalEvents"],
  );

  Map<String, dynamic> toJson() => {
    "totalPages": totalPages,
    "currentPage": currentPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
    "totalEvents": totalEvents,
  };
}

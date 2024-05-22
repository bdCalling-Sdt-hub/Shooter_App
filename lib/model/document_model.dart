

class DocumentModel {
  final String? id;
  final Document? document;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  DocumentModel({
    this.id,
    this.document,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
    id: json["_id"],
    document: json["document"] == null ? null : Document.fromJson(json["document"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "document": document?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Document {
  final dynamic path;
  final String? publicFileUrl;
  final String? fileName;

  Document({
    this.path,
    this.publicFileUrl,
    this.fileName,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    path: json["path"],
    publicFileUrl: json["publicFileURL"],
    fileName: json["fileName"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "publicFileURL": publicFileUrl,
    "fileName": fileName,
  };
}

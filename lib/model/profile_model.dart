

class ProfileModel {
  final String? status;
  final int? statusCode;
  final String? message;
  final Data? data;
  final Pagination? pagination;

  ProfileModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.pagination,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class Data {
  final String? type;
  final Attributes? attributes;

  Data({
    this.type,
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  final String? id;
  final String? name;
  final String? email;
  final bool? privacyPolicyAccepted;
  final bool? isAdmin;
  final bool? isVerified;
  final bool? isDeleted;
  final bool? isBlocked;
  final Image? image;
  final String? subscription;
  final dynamic oneTimeCode;
  final DateTime? dateOfBirth;
  final String? address;
  final String? phone;
  final String? club;
  final String? userClass;
  final String? subscriptionStartDate;
  final String? subscriptionEndDate;
  final int? score;
  final int? v;

  Attributes({
    this.id,
    this.name,
    this.email,
    this.privacyPolicyAccepted,
    this.isAdmin,
    this.isVerified,
    this.isDeleted,
    this.isBlocked,
    this.image,
    this.subscription,
    this.oneTimeCode,
    this.dateOfBirth,
    this.address,
    this.phone,
    this.club,
    this.userClass,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.score,
    this.v,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    privacyPolicyAccepted: json["privacyPolicyAccepted"],
    isAdmin: json["isAdmin"],
    isVerified: json["isVerified"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    subscription: json["subscription"],
    oneTimeCode: json["oneTimeCode"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    address: json["address"],
    phone: json["phone"],
    club: json["club"],
    userClass: json["userClass"],
    subscriptionStartDate: json['subscriptionStartDate'],
    subscriptionEndDate: json['subscriptionEndDate'],
    score: json["score"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "privacyPolicyAccepted": privacyPolicyAccepted,
    "isAdmin": isAdmin,
    "isVerified": isVerified,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "image": image?.toJson(),
    "subscription": subscription,
    "oneTimeCode": oneTimeCode,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "address": address,
    "phone": phone,
    "club": club,
    "userClass": userClass,
    "subscriptionStartDate" : subscriptionStartDate,
    "subscriptionEndDate" : subscriptionEndDate,
    "score": score,
    "__v": v,
  };
}

class Image {
  final String? publicFileUrl;
  final String? path;

  Image({
    this.publicFileUrl,
    this.path,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    publicFileUrl: json["publicFileURL"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "publicFileURL": publicFileUrl,
    "path": path,
  };
}

class Pagination {
  Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
  );

  Map<String, dynamic> toJson() => {
  };
}

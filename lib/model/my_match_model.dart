// To parse this JSON data, do
//
//     final myMatchModel = myMatchModelFromJson(jsonString);

import 'dart:convert';

List<MyMatchModel> myMatchModelFromJson(String str) => List<MyMatchModel>.from(json.decode(str).map((x) => MyMatchModel.fromJson(x)));

String myMatchModelToJson(List<MyMatchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyMatchModel {
  final String? id;
  final String? fullName;
  final String? email;
  final DateTime? phone;
  final String? gender;
  final int? age;
  final String? clubName;
  final Match? match;
  final User? user;
  final int? v;

  MyMatchModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.age,
    this.clubName,
    this.match,
    this.user,
    this.v,
  });

  factory MyMatchModel.fromJson(Map<String, dynamic> json) => MyMatchModel(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"] == null ? null : DateTime.parse(json["phone"]),
    gender: json["gender"],
    age: json["age"],
    clubName: json["clubName"],
    match: json["match"] == null ? null : Match.fromJson(json["match"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phone": phone?.toIso8601String(),
    "gender": gender,
    "age": age,
    "clubName": clubName,
    "match": match?.toJson(),
    "user": user?.toJson(),
    "__v": v,
  };
}

class Match {
  final String? id;
  final String? matchName;
  final String? gender;
  final DateTime? matchDate;
  final String? time;
  final String? prone;
  final String? fee;
  final MatchImage? image;
  final String? createdBy;
  final String? event;
  final String? registrationStatus;
  final int? v;

  Match({
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

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["_id"],
    matchName: json["matchName"],
    gender: json["gender"],
    matchDate: json["matchDate"] == null ? null : DateTime.parse(json["matchDate"]),
    time: json["time"],
    prone: json["prone"],
    fee: json["fee"],
    image: json["image"] == null ? null : MatchImage.fromJson(json["image"]),
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

class MatchImage {
  final String? fieldname;
  final String? originalname;
  final String? encoding;
  final String? mimetype;
  final String? destination;
  final String? filename;
  final String? path;
  final int? size;

  MatchImage({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  });

  factory MatchImage.fromJson(Map<String, dynamic> json) => MatchImage(
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

class User {
  final String? id;
  final String? name;
  final String? email;
  final bool? privacyPolicyAccepted;
  final bool? isAdmin;
  final bool? isVerified;
  final bool? isDeleted;
  final bool? isBlocked;
  final UserImage? image;
  final String? subscription;
  final dynamic oneTimeCode;
  final dynamic dateOfBirth;
  final String? address;
  final String? phone;
  final String? club;
  final String? userClass;
  final int? score;
  final int? v;

  User({
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
    this.score,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    privacyPolicyAccepted: json["privacyPolicyAccepted"],
    isAdmin: json["isAdmin"],
    isVerified: json["isVerified"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    image: json["image"] == null ? null : UserImage.fromJson(json["image"]),
    subscription: json["subscription"],
    oneTimeCode: json["oneTimeCode"],
    dateOfBirth: json["dateOfBirth"],
    address: json["address"],
    phone: json["phone"],
    club: json["club"],
    userClass: json["userClass"],
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
    "dateOfBirth": dateOfBirth,
    "address": address,
    "phone": phone,
    "club": club,
    "userClass": userClass,
    "score": score,
    "__v": v,
  };
}

class UserImage {
  final String? publicFileUrl;
  final String? path;

  UserImage({
    this.publicFileUrl,
    this.path,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
    publicFileUrl: json["publicFileURL"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "publicFileURL": publicFileUrl,
    "path": path,
  };
}

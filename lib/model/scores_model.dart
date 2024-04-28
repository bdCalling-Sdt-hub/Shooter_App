class ScoresModel {
  final String? id;
  final String? event;
  final String? match;
  final List<MatchMember>? matchMember;
  final int? v;

  ScoresModel({
    this.id,
    this.event,
    this.match,
    this.matchMember,
    this.v,
  });

  factory ScoresModel.fromJson(Map<String, dynamic> json) => ScoresModel(
    id: json["_id"],
    event: json["event"],
    match: json["match"],
    matchMember: json["matchMember"] == null ? [] : List<MatchMember>.from(json["matchMember"]!.map((x) => MatchMember.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "event": event,
    "match": match,
    "matchMember": matchMember == null ? [] : List<dynamic>.from(matchMember!.map((x) => x.toJson())),
    "__v": v,
  };
}

class MatchMember {
  final String? matchMemberClass;
  final String? name;
  final String? club;
  final String? score;

  MatchMember({
    this.matchMemberClass,
    this.name,
    this.club,
    this.score,
  });

  factory MatchMember.fromJson(Map<String, dynamic> json) => MatchMember(
    matchMemberClass: json["class"],
    name: json["name"],
    club: json["club"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "class": matchMemberClass,
    "name": name,
    "club": club,
    "score": score,
  };
}
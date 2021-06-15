
class Credit {
  int? _id;
  List<Cast>? _cast;
  List<Crew>? _crew;

  int? get id => _id;
  List<Cast>? get cast => _cast;
  List<Crew>? get crew => _crew;

  Credit({int? id, List<Cast>? cast, List<Crew>? crew}) {
    _id = id;
    _cast = cast;
    _crew = crew;
  }

  Credit.fromJson(dynamic json) {
    _id = json["id"];
    if (json["cast"] != null) {
      _cast = [];
      json["cast"].forEach((v) {
        _cast!.add(Cast.fromJson(v));
      });
    }
    if (json["crew"] != null) {
      _crew = [];
      json["crew"].forEach((v) {
        _crew!.add(Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    if (_cast != null) {
      map["cast"] = _cast!.map((v) => v.toJson()).toList();
    }
    if (_crew != null) {
      map["crew"] = _crew!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
class Crew {
  String? _creditId;
  String? _department;
  int? _gender;
  int? _id;
  String? _job;
  String? _name;
  dynamic _profilePath;

  String? get creditId => _creditId;
  String? get department => _department;
  int? get gender => _gender;
  int? get id => _id;
  String? get job => _job;
  String? get name => _name;
  dynamic get profilePath => _profilePath;

  Crew(
      {String? creditId,
      String? department,
      int? gender,
      int? id,
      String? job,
      String? name,
      dynamic profilePath}) {
    _creditId = creditId;
    _department = department;
    _gender = gender;
    _id = id;
    _job = job;
    _name = name;
    _profilePath = profilePath;
  }

  Crew.fromJson(dynamic json) {
    _creditId = json["creditId"];
    _department = json["department"];
    _gender = json["gender"];
    _id = json["id"];
    _job = json["job"];
    _name = json["name"];
    _profilePath = json["profilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["creditId"] = _creditId;
    map["department"] = _department;
    map["gender"] = _gender;
    map["id"] = _id;
    map["job"] = _job;
    map["name"] = _name;
    map["profilePath"] = _profilePath;
    return map;
  }
}

class Cast {
  int? _castId;
  String? _character;
  String? _creditId;
  int? _gender;
  int? _id;
  String? _name;
  int? _order;
  String? _profilePath;

  int? get castId => _castId;
  String? get character => _character;
  String? get creditId => _creditId;
  int? get gender => _gender;
  int? get id => _id;
  String? get name => _name;
  int? get order => _order;
  String? get profilePath => _profilePath;

  Cast(
      {int? castId,
      String? character,
      String? creditId,
      int? gender,
      int? id,
      String? name,
      int? order,
      String? profilePath}) {
    _castId = castId;
    _character = character;
    _creditId = creditId;
    _gender = gender;
    _id = id;
    _name = name;
    _order = order;
    _profilePath = profilePath;
  }

  Cast.fromJson(dynamic json) {
    _castId = json["castId"];
    _character = json["character"];
    _creditId = json["creditId"];
    _gender = json["gender"];
    _id = json["id"];
    _name = json["name"];
    _order = json["order"];
    _profilePath = json["profilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["castId"] = _castId;
    map["character"] = _character;
    map["creditId"] = _creditId;
    map["gender"] = _gender;
    map["id"] = _id;
    map["name"] = _name;
    map["order"] = _order;
    map["profilePath"] = _profilePath;
    return map;
  }
}

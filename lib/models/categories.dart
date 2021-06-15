class Categories {
  List<Genres>? _genres;

  List<Genres>? get genres => _genres;

  Categories({required List<Genres> genres}) {
    _genres = genres;
  }

  Categories.fromJson(dynamic json) {
    if (json["genres"] != null) {
      _genres = [];
      json["genres"].forEach((v) {
        _genres!.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_genres != null) {
      map["genres"] = _genres!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Genres {
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Genres({required int id, required String name}) {
    _id = id;
    _name = name;
  }

  Genres.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}

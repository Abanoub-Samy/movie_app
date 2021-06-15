/// adult : false
/// backdrop_path : "/kMe4TKMDNXTKptQPAdOF0oZHq3V.jpg"
/// belongs_to_collection : null
/// budget : 21000000
/// genres : [{"id":12,"name":"Adventure"},{"id":80,"name":"Crime"},{"id":18,"name":"Drama"},{"id":9648,"name":"Mystery"}]
/// homepage : "https://www.netflix.com/title/81277950"
/// id : 497582
/// imdb_id : "tt7846844"
/// original_language : "en"
/// original_title : "Enola Holmes"
/// overview : "While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord."
/// popularity : 1969.622
/// poster_path : "/riYInlsq2kf1AWoGm80JQW5dLKp.jpg"
/// production_companies : [{"id":121424,"logo_path":null,"name":"PCMA Productions","origin_country":""},{"id":923,"logo_path":"/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png","name":"Legendary Pictures","origin_country":"US"},{"id":174,"logo_path":"/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png","name":"Warner Bros. Pictures","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"GB","name":"United Kingdom"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2020-09-23"
/// revenue : 0
/// runtime : 123
/// spoken_languages : [{"iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Mystery runs in the family."
/// title : "Enola Holmes"
/// video : false
/// vote_average : 7.7
/// vote_count : 1365

class MovieDetails {
  bool _adult;
  String _backdropPath;
  dynamic _belongsToCollection;
  int _budget;
  List<Genres> _genres;
  String _homepage;
  int _id;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  List<Production_companies> _productionCompanies;
  List<Production_countries> _productionCountries;
  String _releaseDate;
  int _revenue;
  int _runtime;
  List<Spoken_languages> _spokenLanguages;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  bool get adult => _adult;
  String get backdropPath => _backdropPath;
  dynamic get belongsToCollection => _belongsToCollection;
  int get budget => _budget;
  List<Genres> get genres => _genres;
  String get homepage => _homepage;
  int get id => _id;
  String get imdbId => _imdbId;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  List<Production_companies> get productionCompanies => _productionCompanies;
  List<Production_countries> get productionCountries => _productionCountries;
  String get releaseDate => _releaseDate;
  int get revenue => _revenue;
  int get runtime => _runtime;
  List<Spoken_languages> get spokenLanguages => _spokenLanguages;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  int get voteCount => _voteCount;

  MovieDetails(
      {bool adult,
      String backdropPath,
      dynamic belongsToCollection,
      int budget,
      List<Genres> genres,
      String homepage,
      int id,
      String imdbId,
      String originalLanguage,
      String originalTitle,
      String overview,
      double popularity,
      String posterPath,
      List<Production_companies> productionCompanies,
      List<Production_countries> productionCountries,
      String releaseDate,
      int revenue,
      int runtime,
      List<Spoken_languages> spokenLanguages,
      String status,
      String tagline,
      String title,
      bool video,
      double voteAverage,
      int voteCount}) {
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _budget = budget;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  MovieDetails.fromJson(dynamic json) {
    _adult = json["adult"];
    _backdropPath = json["backdropPath"];
    _belongsToCollection = json["belongsToCollection"];
    _budget = json["budget"];
    if (json["genres"] != null) {
      _genres = [];
      json["genres"].forEach((v) {
        _genres.add(Genres.fromJson(v));
      });
    }
    _homepage = json["homepage"];
    _id = json["id"];
    _imdbId = json["imdbId"];
    _originalLanguage = json["originalLanguage"];
    _originalTitle = json["originalTitle"];
    _overview = json["overview"];
    _popularity = json["popularity"];
    _posterPath = json["posterPath"];
    if (json["productionCompanies"] != null) {
      _productionCompanies = [];
      json["productionCompanies"].forEach((v) {
        _productionCompanies.add(Production_companies.fromJson(v));
      });
    }
    if (json["productionCountries"] != null) {
      _productionCountries = [];
      json["productionCountries"].forEach((v) {
        _productionCountries.add(Production_countries.fromJson(v));
      });
    }
    _releaseDate = json["releaseDate"];
    _revenue = json["revenue"];
    _runtime = json["runtime"];
    if (json["spokenLanguages"] != null) {
      _spokenLanguages = [];
      json["spokenLanguages"].forEach((v) {
        _spokenLanguages.add(Spoken_languages.fromJson(v));
      });
    }
    _status = json["status"];
    _tagline = json["tagline"];
    _title = json["title"];
    _video = json["video"];
    _voteAverage = json["voteAverage"];
    _voteCount = json["voteCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["backdropPath"] = _backdropPath;
    map["belongsToCollection"] = _belongsToCollection;
    map["budget"] = _budget;
    if (_genres != null) {
      map["genres"] = _genres.map((v) => v.toJson()).toList();
    }
    map["homepage"] = _homepage;
    map["id"] = _id;
    map["imdbId"] = _imdbId;
    map["originalLanguage"] = _originalLanguage;
    map["originalTitle"] = _originalTitle;
    map["overview"] = _overview;
    map["popularity"] = _popularity;
    map["posterPath"] = _posterPath;
    if (_productionCompanies != null) {
      map["productionCompanies"] =
          _productionCompanies.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map["productionCountries"] =
          _productionCountries.map((v) => v.toJson()).toList();
    }
    map["releaseDate"] = _releaseDate;
    map["revenue"] = _revenue;
    map["runtime"] = _runtime;
    if (_spokenLanguages != null) {
      map["spokenLanguages"] = _spokenLanguages.map((v) => v.toJson()).toList();
    }
    map["status"] = _status;
    map["tagline"] = _tagline;
    map["title"] = _title;
    map["video"] = _video;
    map["voteAverage"] = _voteAverage;
    map["voteCount"] = _voteCount;
    return map;
  }
}

/// iso_639_1 : "en"
/// name : "English"

class Spoken_languages {
  String _iso6391;
  String _name;

  String get iso6391 => _iso6391;
  String get name => _name;

  Spoken_languages({String iso6391, String name}) {
    _iso6391 = iso6391;
    _name = name;
  }

  Spoken_languages.fromJson(dynamic json) {
    _iso6391 = json["iso6391"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso6391"] = _iso6391;
    map["name"] = _name;
    return map;
  }
}

/// iso_3166_1 : "GB"
/// name : "United Kingdom"

class Production_countries {
  String _iso31661;
  String _name;

  String get iso31661 => _iso31661;
  String get name => _name;

  Production_countries({String iso31661, String name}) {
    _iso31661 = iso31661;
    _name = name;
  }

  Production_countries.fromJson(dynamic json) {
    _iso31661 = json["iso31661"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso31661"] = _iso31661;
    map["name"] = _name;
    return map;
  }
}

/// id : 121424
/// logo_path : null
/// name : "PCMA Productions"
/// origin_country : ""

class Production_companies {
  int _id;
  dynamic _logoPath;
  String _name;
  String _originCountry;

  int get id => _id;
  dynamic get logoPath => _logoPath;
  String get name => _name;
  String get originCountry => _originCountry;

  Production_companies(
      {int id, dynamic logoPath, String name, String originCountry}) {
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
  }

  Production_companies.fromJson(dynamic json) {
    _id = json["id"];
    _logoPath = json["logoPath"];
    _name = json["name"];
    _originCountry = json["originCountry"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["logoPath"] = _logoPath;
    map["name"] = _name;
    map["originCountry"] = _originCountry;
    return map;
  }
}

/// id : 12
/// name : "Adventure"

class Genres {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Genres({int id, String name}) {
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

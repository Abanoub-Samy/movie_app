class TrendMovie {
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  int? get page => _page;
  List<Results>? get results => _results;
  int? get totalPages => _totalPages;
  int? get totalResults => _totalResults;

  TrendMovie(
      {int? page, List<Results>? results, int? totalPages, int? totalResults}) {
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  TrendMovie.fromJson(dynamic json) {
    _page = json["page"];
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results!.add(Results.fromJson(v));
      });
    }
    _totalPages = json["totalPages"];
    _totalResults = json["totalResults"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    if (_results != null) {
      map["results"] = _results!.map((v) => v.toJson()).toList();
    }
    map["totalPages"] = _totalPages;
    map["totalResults"] = _totalResults;
    return map;
  }
}

class Results {
  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;
  double? _popularity;
  String? _mediaType;

  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<int>? get genreIds => _genreIds;
  int? get id => _id;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  String? get releaseDate => _releaseDate;
  String? get title => _title;
  bool? get video => _video;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;
  double? get popularity => _popularity;
  String? get mediaType => _mediaType;

  Results(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      String? posterPath,
      String? releaseDate,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount,
      double? popularity,
      String? mediaType}) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _popularity = popularity;
    _mediaType = mediaType;
  }

  Results.fromJson(dynamic json) {
    _adult = json["adult"];
    _backdropPath = json["backdropPath"];
    _genreIds = json["genreIds"] != null ? json["genreIds"].cast<int>() : [];
    _id = json["id"];
    _originalLanguage = json["originalLanguage"];
    _originalTitle = json["originalTitle"];
    _overview = json["overview"];
    _posterPath = json["posterPath"];
    _releaseDate = json["releaseDate"];
    _title = json["title"];
    _video = json["video"];
    _voteAverage = json["voteAverage"];
    _voteCount = json["voteCount"];
    _popularity = json["popularity"];
    _mediaType = json["mediaType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["backdropPath"] = _backdropPath;
    map["genreIds"] = _genreIds;
    map["id"] = _id;
    map["originalLanguage"] = _originalLanguage;
    map["originalTitle"] = _originalTitle;
    map["overview"] = _overview;
    map["posterPath"] = _posterPath;
    map["releaseDate"] = _releaseDate;
    map["title"] = _title;
    map["video"] = _video;
    map["voteAverage"] = _voteAverage;
    map["voteCount"] = _voteCount;
    map["popularity"] = _popularity;
    map["mediaType"] = _mediaType;
    return map;
  }
}

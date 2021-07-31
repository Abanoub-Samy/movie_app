class SetFavoriteModel {
  int? statusCode;
  String? statusMessage;

  SetFavoriteModel({this.statusCode, this.statusMessage});

  SetFavoriteModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}

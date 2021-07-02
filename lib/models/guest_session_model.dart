class GuestSessionModel {
  bool? success;
  String? guestSessionId;
  String? expiresAt;

  GuestSessionModel({this.success, this.guestSessionId, this.expiresAt});

  GuestSessionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    guestSessionId = json['guest_session_id'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['guest_session_id'] = this.guestSessionId;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}

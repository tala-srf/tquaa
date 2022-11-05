class TrueRegisterModle {
  bool? canLogin;

  TrueRegisterModle({this.canLogin});

  TrueRegisterModle.fromJson(Map<String, dynamic> json) {
    canLogin = json['canLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canLogin'] = this.canLogin;
    return data;
  }
}
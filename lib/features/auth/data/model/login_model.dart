class LoginModel {
  String? userNameOrEmailAddress;
  String? password;
  bool? rememberClient;
  

  LoginModel({
    this.userNameOrEmailAddress,
    this.password,
    this.rememberClient,

  });

  LoginModel.fromJson(
    Map<String, dynamic> json,
  ) {

    userNameOrEmailAddress = json['userNameOrEmailAddress'];
    password = json['password'];
    rememberClient = json['rememberClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  
    data['userNameOrEmailAddress'] = userNameOrEmailAddress;
    data['password'] = password;
    data['rememberClient'] = rememberClient;
    return data;
  }
}

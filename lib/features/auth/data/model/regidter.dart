class RegisterModel {
  String? name;
  int? gender;
  int? age;
  int? cityId;
  int? countryId;
  String? phoneNumber;
  String? emailAddress;
  String? password;
  String? avatar;

  RegisterModel(
      {this.name,
      this.gender,
      this.age,
      this.cityId,
      this.countryId,
      this.phoneNumber,
      this.emailAddress,
      this.password,
      this.avatar});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    cityId = json['cityId'];
    countryId = json['countryId'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    password = json['password'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] =name;
    data['gender'] =gender;
    data['age'] =age;
    data['cityId'] =cityId;
    data['countryId'] =countryId;
    data['phoneNumber'] =phoneNumber;
    data['emailAddress'] =emailAddress;
    data['password'] =password;
    data['avatar'] =avatar;
    return data;
  }
}
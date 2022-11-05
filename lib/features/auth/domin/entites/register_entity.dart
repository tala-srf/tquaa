import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? name;
  final int? gender;
  final int? age;
  final int? cityId;
  final int? countryId;
  final String? phoneNumber;
  final String? emailAddress;
  final String? password;
  final String? avatar;

  const RegisterEntity(this.name, this.gender, this.age, this.cityId, this.countryId,
      this.phoneNumber, this.emailAddress, this.password, this.avatar);

  @override
  List<Object?> get props => [
        name,
        gender,
        age,
        cityId,
        countryId,
        phoneNumber,
        emailAddress,
        password,
        avatar
      ];
}

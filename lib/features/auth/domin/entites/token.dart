import 'package:equatable/equatable.dart';


class TokenEntity extends Equatable {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  int? userId;

  TokenEntity(
      {this.accessToken,
      this.encryptedAccessToken,
      this.expireInSeconds,
      this.userId});
      
        @override
    
        List<Object?> get props => [accessToken,encryptedAccessToken,expireInSeconds,userId];
}

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  bool login;
  final String userName;
  final String employeeName;
  final String employeeId;
  final String userRole;
  final String status;
  AccessToken accessToken;

  UserModel(
      {required this.login,
      this.userName = "",
      this.employeeName = "",
      this.employeeId = "",
      this.userRole = "",
      this.status = "",
      required this.accessToken});
  UserModel.fromJson(Map<String, dynamic> json)
      : login = false,
        userName = json['userName'],
        employeeName = json['employeeName'],
        employeeId = json['employeeId'],
        userRole = json['userRole'],
        status = json['status'],
        accessToken = new AccessToken();

  Map<String, dynamic> toJson() => {
        'login': login,
        'userName': userName,
        'employeeName': employeeName,
        'employeeId': employeeId,
        'userRole': userRole,
        'status': status,
      };

  @override
  List<Object?> get props => [
        login,
        userName,
        employeeName,
        employeeId,
        userRole,
        status,
        accessToken
      ];
}

class AccessToken extends Equatable {
  final String accessToken;
  final int expiredTime;
  final String tokenType;
  final String scope;

  const AccessToken(
      {this.accessToken = "",
      this.expiredTime = 0,
      this.tokenType = "",
      this.scope = ""});

  AccessToken.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        expiredTime = json['expires_in'],
        tokenType = json['token_type'],
        scope = json['scope'];

  @override
  List<Object?> get props => [accessToken, expiredTime, tokenType, scope];
}

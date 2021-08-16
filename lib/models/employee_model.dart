import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  String employeeId;
  String fullName;
  String pin;
  String gender;
  String dob;
  String martialStatus;
  EmployeeModel(this.dob, this.employeeId, this.gender, this.fullName,
      this.martialStatus, this.pin);
  EmployeeModel.fromJson(Map<String, dynamic> json)
      : employeeId = json['code'] == null ? "" : json["code"],
        fullName = json['fullName'] == null ? "" : json['fullName'],
        pin = "",
        gender = json['gender'] == null ? "" : json['gender'],
        dob = json['dob'] == null ? "" : json['dob'],
        martialStatus =
            json['maritalStatus'] == null ? "" : json["maritalStatus"];

  @override
  List<Object?> get props =>
      [employeeId, fullName, pin, employeeId, gender, martialStatus];
}

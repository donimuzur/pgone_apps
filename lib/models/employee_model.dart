import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  String employeeId;
  String fullName;
  String pin;
  String gender;
  String martialStatus;
  EmployeeModel(this.employeeId, this.gender, this.fullName, this.martialStatus,
      this.pin);
  EmployeeModel.fromJson(Map<String, dynamic> json)
      : employeeId = json['code'],
        fullName = json['fullName'],
        pin = "",
        gender = json['gender'],
        martialStatus = json['maritalStatus'];

  @override
  List<Object?> get props =>
      [employeeId, fullName, pin, employeeId, gender, martialStatus];
}

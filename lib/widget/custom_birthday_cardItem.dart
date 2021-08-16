import 'package:flutter/material.dart';
import 'package:pgone_apps/models/employee_model.dart';
import '../shared/theme.dart';
import '../helper/helper_funct.dart';

class CustomCardBirthdayItemWidget extends StatelessWidget {
  final EmployeeModel employee;

  const CustomCardBirthdayItemWidget(
    this.employee, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                color: kMainBackgroundColor,
                child: Image(
                  width: 80,
                  height: 80,
                  image: AssetImage(employee.gender == "Male"
                      ? "assets/images/avatar-boy.png"
                      : "assets/images/avatar-girl.png"),
                ),
              ),
            ),
            Text(
              employee.fullName.capitalize(),
              style: mainTextStyle.copyWith(
                  fontSize: 16,
                  color: Color(0xff22215B),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              employee.dob,
              style: mainTextStyle.copyWith(
                  fontSize: 14,
                  color: Color(0xff22215B),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}

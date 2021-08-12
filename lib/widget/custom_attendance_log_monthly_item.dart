import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomAttendanceMonthLogItemWidget extends StatelessWidget {
  final Color warna;
  final String title;
  final String number;
  const CustomAttendanceMonthLogItemWidget(
      {Key? key,
      required this.number,
      required this.title,
      required this.warna})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: warna),
                ),
                Text(
                  title,
                  style: mainTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: kBlueColor),
              child: Text(
                number,
                style: mainTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

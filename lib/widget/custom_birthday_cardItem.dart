import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomCardBirthdayItemWidget extends StatelessWidget {
  final String fullName;
  final String dateBirth;
  final String url;
  final Color backgroundColor;

  const CustomCardBirthdayItemWidget(
      {Key? key,
      required this.fullName,
      required this.dateBirth,
      required this.url,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                color: backgroundColor,
                child: Image(
                  width: 80,
                  height: 80,
                  image: AssetImage(url),
                ),
              ),
            ),
            Text(
              fullName,
              style: mainTextStyle.copyWith(
                  fontSize: 16,
                  color: Color(0xff22215B),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              dateBirth,
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomBannerAttendanceWidget extends StatefulWidget {
  CustomBannerAttendanceWidget({Key? key}) : super(key: key);

  @override
  _CustomBannerAttendanceWidgetState createState() =>
      _CustomBannerAttendanceWidgetState();
}

class _CustomBannerAttendanceWidgetState
    extends State<CustomBannerAttendanceWidget> {
  String time = "";
  String day = "";
  String month = "";
  late Timer timer;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          time = DateFormat("hh:mm:ss aaa").format(DateTime.now());
          day = DateFormat("dd").format(DateTime.now());
          month = DateFormat("MMM").format(DateTime.now());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image(
            image: AssetImage("assets/images/banner-date.png"),
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20, left: 80),
              child: Text(
                day + "\n" + month,
                style: mainTextStyle.copyWith(
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(5, 5))
                    ],
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              alignment: Alignment.center,
              child: Text(
                time,
                style: mainTextStyle.copyWith(
                    fontSize: 50,
                    shadows: <Shadow>[
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(5, 5))
                    ],
                    fontWeight: FontWeight.bold,
                    color: kBlueColor),
              ),
            )
          ],
        ),
      ],
    );
  }
}

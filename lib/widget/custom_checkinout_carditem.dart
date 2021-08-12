import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomCheckinOutCardItemWidget extends StatelessWidget {
  final bool isCheckIn;
  final String time;
  final String location;
  const CustomCheckinOutCardItemWidget(
      {Key? key,
      required this.isCheckIn,
      required this.location,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: Row(
        children: [
          ClipOval(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: isCheckIn ? kBlueColor : kYellowColor,
                child: Image(
                  image: isCheckIn
                      ? AssetImage("assets/images/enter.png")
                      : AssetImage("assets/images/out.png"),
                  width: 50,
                  height: 50,
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: mainTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlueColor),
                  ),
                  Text(
                    location,
                    style: mainTextStyle.copyWith(
                        fontWeight: FontWeight.w700, color: Color(0xff6B6B6B)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pgone_apps/helper/helper_enum.dart';
import 'package:pgone_apps/helper/helper_funct.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomLeavesCardItemWidget extends StatelessWidget {
  final EnumLeaveType leaveType;
  final String date;
  final EnumDurationLeave leaveDuration;
  final EnumStatusLeave leaveStatus;

  const CustomLeavesCardItemWidget(
      {Key? key,
      required this.leaveType,
      required this.date,
      required this.leaveDuration,
      required this.leaveStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leaveDuration.text,
                style: mainTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: leaveDuration.textColor),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  date,
                  style: mainTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Text(
                leaveType.text,
                style: mainTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: leaveType.color),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                child: Text(
                  leaveStatus.text,
                  style: mainTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: leaveStatus.textColor),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: leaveStatus.backgroundColor),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffC4C4C4)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward_rounded,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

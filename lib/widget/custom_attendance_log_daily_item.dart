import 'package:flutter/material.dart';
import 'package:pgone_apps/models/attendance_daily_log_model.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomAttendanceDailyLogItemWidget extends StatelessWidget {
  final AttendanceDailyLogModel attendanceDailyLogModel;
  const CustomAttendanceDailyLogItemWidget(
      {Key? key, required this.attendanceDailyLogModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text(
              attendanceDailyLogModel.tgl,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              attendanceDailyLogModel.day,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              attendanceDailyLogModel.status,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              attendanceDailyLogModel.checkIn,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              attendanceDailyLogModel.checkOut,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              attendanceDailyLogModel.jamKerja,
              textAlign: TextAlign.center,
              style: mainTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

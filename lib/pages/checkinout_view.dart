import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pgone_apps/models/checkinout_model.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_banner_attendance.dart';
import 'package:pgone_apps/widget/custom_checkinout_carditem.dart';

class CheckInOutView extends StatelessWidget {
  const CheckInOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CheckInOutModel> data = [];

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: false,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    data.add(
      CheckInOutModel(
          isCheckIn: true,
          location:
              " 819, Times Square Arcade, Baghban Party Plot Cross Road, Thaltej - Shilaj Rd, Ahmedabad, Gujarat 380059",
          time: "09:15:30 PM"),
    );

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kMainBackgroundColor,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            elevation: 0,
                            primary: kMainBackgroundColor,
                            onPrimary: kBlueColor),
                        child: Icon(
                          Icons.arrow_back,
                          size: 45,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Attendance",
                          style: mainTextStyle.copyWith(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: kBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomBannerAttendanceWidget(),
              ],
            ),
          ),
          Expanded(
            // The ListView
            child: ListView.builder(
                itemCount: data.length, // The length,
                itemBuilder: (_, index) {
                  return CustomCheckinOutCardItemWidget(
                      isCheckIn: data[index].isCheckIn,
                      location: data[index].location,
                      time: data[index].time);
                }),
          ),
        ],
      )),
    );
  }
}

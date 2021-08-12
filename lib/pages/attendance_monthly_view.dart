import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_attendance_log_monthly_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AttendanceMonthlyView extends StatelessWidget {
  const AttendanceMonthlyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: SfCalendar(
          firstDayOfWeek: 1,
          cellBorderColor: Colors.white,
          view: CalendarView.month,
          viewNavigationMode: ViewNavigationMode.snap,
          headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: mainTextStyle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kBlueColor)),
          monthViewSettings: MonthViewSettings(
              monthCellStyle: MonthCellStyle(
                textStyle: mainTextStyle.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
                trailingDatesTextStyle: mainTextStyle.copyWith(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
                leadingDatesTextStyle: mainTextStyle.copyWith(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              dayFormat: 'EE'),
        ),
      ),
      CustomAttendanceMonthLogItemWidget(
          number: "10", title: "Hadir", warna: Color(0xff00C34E)),
      CustomAttendanceMonthLogItemWidget(
          number: "10", title: "Absent", warna: Color(0xffBA1616)),
      CustomAttendanceMonthLogItemWidget(
          number: "10",
          title: "With Out Leave Absent",
          warna: Color(0xffBA1616)),
      CustomAttendanceMonthLogItemWidget(
          number: "10", title: "Manually Absent", warna: Color(0xffBA1616)),
      CustomAttendanceMonthLogItemWidget(
          number: "10", title: "Half Day", warna: Color(0xffBA1616))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:pgone_apps/models/attendance_daily_log_model.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_attendance_log_daily_item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceDailyView extends StatelessWidget {
  const AttendanceDailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Ijin/Sakit', 5),
      _SalesData('Cuti', 10),
      _SalesData('Alpha', 15)
    ];

    List<AttendanceDailyLogModel> attendanceDailyData = [
      AttendanceDailyLogModel(
          status: "Hadir",
          tgl: "1",
          checkIn: "08:03",
          checkOut: "17:00",
          day: "Senin",
          jamKerja: "08:00"),
      AttendanceDailyLogModel(
          status: "Hadir",
          tgl: "2",
          checkIn: "08:10",
          checkOut: "17:00",
          day: "Selasa",
          jamKerja: "08:00"),
      AttendanceDailyLogModel(
          status: "Hadir",
          tgl: "3",
          checkIn: "07:57",
          checkOut: "17:00",
          day: "Rabu",
          jamKerja: "08:00"),
      AttendanceDailyLogModel(
          status: "Hadir",
          tgl: "4",
          checkIn: "08:02",
          checkOut: "17:00",
          day: "Kamis",
          jamKerja: "08:00"),
      AttendanceDailyLogModel(
          status: "Hadir",
          tgl: "5",
          checkIn: "07:39",
          checkOut: "17:00",
          day: "Jumat",
          jamKerja: "08:00"),
      AttendanceDailyLogModel(tgl: "6", day: "Sabtu", status: "Libur"),
      AttendanceDailyLogModel(tgl: "7", day: "Minggu", status: "Libur")
    ];

    TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

    Widget _chartDailyAttendanceWidget() {
      return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: Container(child: null),
            )
          ],
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            position: LegendPosition.bottom,
          ),
          series: <CircularSeries<_SalesData, String>>[
            RadialBarSeries<_SalesData, String>(
              cornerStyle: CornerStyle.bothCurve,
              dataSource: data,
              radius: "100%",
              enableTooltip: true,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales',
              dataLabelSettings: DataLabelSettings(isVisible: false),
              maximumValue: 10,
            ),
          ],
        ),
      );
    }

    Widget _tableDailyAttendanceWidget() {
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xffD7DFF6),
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Tanggal",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    "Hari",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    "Status",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    "Check In",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    "Check Out",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    "Jam Kerja",
                    textAlign: TextAlign.center,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff415EB6)),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 5,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xff415EB6),
                  borderRadius: BorderRadius.circular(5)),
            ),
            for (var item in attendanceDailyData)
              CustomAttendanceDailyLogItemWidget(attendanceDailyLogModel: item)
          ],
        ),
      );
    }

    return ListView(
      children: [_chartDailyAttendanceWidget(), _tableDailyAttendanceWidget()],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

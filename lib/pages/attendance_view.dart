import 'package:flutter/material.dart';
import 'package:pgone_apps/pages/attendance_daily_view.dart';
import 'package:pgone_apps/pages/attendance_monthly_view.dart';
import 'package:pgone_apps/shared/theme.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
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
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Kehadiran",
                      style: mainTextStyle.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kBlueColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // give the tab bar a height [can change hheight to preferred height]
                      Container(
                        height: 45,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: kBlueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          labelColor: kBlueColor,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            // first tab [you can add an icon using the icon property]
                            Tab(
                              child: Text(
                                "Kehadiran Harian",
                                style: mainTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),

                            // second tab [you can add an icon using the icon property]
                            Tab(
                              child: Text(
                                "Kehadiran Bulanan",
                                style: mainTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // tab bar view here
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // first tab bar view widget
                            AttendanceDailyView(),
                            // second tab bar view widget
                            AttendanceMonthlyView()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

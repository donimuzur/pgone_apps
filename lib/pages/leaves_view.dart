import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pgone_apps/helper/helper_enum.dart';
import 'package:pgone_apps/pages/attendance_view.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_leaves_carditem.dart';

import 'attendance_daily_view.dart';
import 'attendance_monthly_view.dart';

class LeavesView extends StatefulWidget {
  const LeavesView({Key? key}) : super(key: key);

  @override
  _LeavesViewState createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.index = 0;
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
                    height: 50,
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
                      "Cuti",
                      style: mainTextStyle.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kBlueColor),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kBlueColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: Icon(
                        Icons.add,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/AddNewCuti");
                      },
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
                                "Semua",
                                style: mainTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: EnumLeaveType.Casual.color),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Cuti Tahunan",
                                      textAlign: TextAlign.justify,
                                      style: mainTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: EnumLeaveType.Sick.color),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sakit",
                                      style: mainTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
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
                            AttendanceMonthlyView(),
                            ListView(
                              children: [
                                CustomLeavesCardItemWidget(
                                  leaveDuration: EnumDurationLeave.HalfDay,
                                  leaveType: EnumLeaveType.Casual,
                                  date: DateFormat("EEE, MMM d")
                                      .format(DateTime.now()),
                                  leaveStatus: EnumStatusLeave.waiting,
                                )
                              ],
                            )
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

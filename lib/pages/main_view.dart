import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgone_apps/cubit/auth_cubit.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_birthday_cardItem.dart';
import 'package:pgone_apps/widget/custom_menu_itemButton.dart';
import 'package:pgone_apps/helper/helper_funct.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserModel;
    Widget __profileAndCheckInWidget() {
      return Stack(children: [
        // Profile
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.zero)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  child: Icon(
                    Icons.settings,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Setting", arguments: args);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/Setting");
                      },
                      child: ClipOval(
                        child: Container(
                          color: Color(0xffF1F3F6),
                          child: Image(
                            image: AssetImage("assets/images/avatar-boy.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Selamat pagi",
                          style: mainTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: kBlueColor),
                        ),
                        Text(
                          args.employeeName,
                          style: mainTextStyle.copyWith(
                              wordSpacing: 0,
                              fontWeight: FontWeight.bold,
                              color: kBlueColor,
                              fontSize: 29),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Programmer",
                          style: mainTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff878787)),
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),

        //Checkin box
        Container(
          margin: EdgeInsets.only(top: 180, right: 28, left: 35),
          padding: EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff22215B)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check In",
                      style: mainTextStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Kamu belum melakukan check in hari ini ...",
                      style: mainTextStyle.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 50),
                    Text("Semoga hari ini menyenangkan",
                        style: mainTextStyle.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle),
                height: 120,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/CheckInOut");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.grey),
                    child: Text(
                      "Check In",
                      textAlign: TextAlign.center,
                      style: mainTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kBlueColor),
                    )),
              )
            ],
          ),
        )
      ]);
    }

    Widget __quickMenuWidget() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menu",
              style: mainTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Color(0xff22215B)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItemMenuButtonWidget(
                    title: "Kehadiran",
                    path: "assets/images/menu-icon/attendance.png",
                    backgroundColor: Color(0xffEEF7FE),
                    splashColor: Color(0xffEEF7FE).withRed(180),
                    titleColor: Color(0xff415EB6),
                    action: () {
                      Navigator.pushNamed(context, "/Attendance");
                    },
                  ),
                  CustomItemMenuButtonWidget(
                    title: "Rekap Kehadiran",
                    path: "assets/images/menu-icon/daily-attendance.png",
                    backgroundColor: Color(0xffFFFBEC),
                    splashColor: Color(0xffFFFBEC).withBlue(180),
                    titleColor: Color(0xffFFB110),
                    action: () {},
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItemMenuButtonWidget(
                    title: "Cuti",
                    path: "assets/images/menu-icon/leave.png",
                    backgroundColor: Color(0xffFEEEEE),
                    splashColor: Color(0xffFEEEEE).withGreen(180),
                    titleColor: Color(0xffF45656),
                    action: () {
                      Navigator.pushNamed(context, "/Cuti");
                    },
                  ),
                  CustomItemMenuButtonWidget(
                    title: "Libur",
                    path: "assets/images/menu-icon/holiday.png",
                    backgroundColor: Color(0xffF0FFFF),
                    splashColor: Color(0xffF0FFFF).withRed(180),
                    titleColor: Color(0xff23B0B0),
                    action: () {},
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItemMenuButtonWidget(
                    title: "Todo list",
                    path: "assets/images/menu-icon/todo.png",
                    backgroundColor: Color(0xffD2FFEA),
                    splashColor: Color(0xffD2FFEA).withBlue(180),
                    titleColor: Color(0xff509A53),
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget __upcomingBirthdayWidget() {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Birthday",
                  style: mainTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Color(0xff22215B)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: mainTextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Color(0xff22215B)),
                    )),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCardBirthdayItemWidget(
                      fullName: "Muhammad Zulfi Rusdani",
                      dateBirth: "04 Oktober",
                      url: "assets/images/avatar-boy.png",
                      backgroundColor: kMainBackgroundColor),
                  CustomCardBirthdayItemWidget(
                      fullName: "JAMI'AN".capitalize(),
                      dateBirth: "28 Juli",
                      url: "assets/images/avatar-boy.png",
                      backgroundColor: kMainBackgroundColor),
                  CustomCardBirthdayItemWidget(
                      fullName: "AHMAD SYARIFUDDIN".capitalize(),
                      dateBirth: "29 Juli",
                      url: "assets/images/avatar-boy.png",
                      backgroundColor: kMainBackgroundColor),
                  CustomCardBirthdayItemWidget(
                      fullName: "TANHAR".capitalize(),
                      dateBirth: "30 Juli",
                      url: "assets/images/avatar-boy.png",
                      backgroundColor: kMainBackgroundColor),
                  CustomCardBirthdayItemWidget(
                      fullName: "Mahyono".capitalize(),
                      dateBirth: "30 Juli",
                      url: "assets/images/avatar-boy.png",
                      backgroundColor: kMainBackgroundColor),
                  CustomCardBirthdayItemWidget(
                      fullName: "DIAN SITORESMI",
                      dateBirth: "30 Juli",
                      url: "assets/images/avatar-girl.png",
                      backgroundColor: kMainBackgroundColor),
                ],
              ),
            )
          ]));
    }

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            __profileAndCheckInWidget(),
            __quickMenuWidget(),
            __upcomingBirthdayWidget()
          ],
        ),
      ),
    );
  }
}

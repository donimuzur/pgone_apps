import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pgone_apps/cubit/auth_cubit.dart';
import 'package:pgone_apps/cubit/setting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgone_apps/helper/helper_enum.dart';
import 'package:pgone_apps/models/employee_model.dart';
import 'package:pgone_apps/models/user_model.dart';
import 'package:pgone_apps/services/employee_service.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_setting_menu.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isEditable = false;
  EnumGender? _gender = EnumGender.male;
  EnumMaritalStatus? _maritalStatus = EnumMaritalStatus.single;
  late EmployeeModel emp;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserModel;
    showAlertDialog() {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text(
          "Cancel",
          style: mainTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = TextButton(
        child: Text(
          "Iya",
          style: mainTextStyle.copyWith(
              fontWeight: FontWeight.bold, color: Colors.red),
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/SignIn", (route) => false);
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        content: Text("Apakah anda ingin keluar dari aplikasi ? "),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    Widget settingsDrawer() {
      return SafeArea(
        child: Drawer(
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    color: Color(0xffF1F3F6),
                    child: Image(
                      image: AssetImage("assets/images/avatar-boy.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) {
                    if (state is SettingSuccess) {
                      return Text(
                        "Muhammad Zulfi Rusdani",
                        style: mainTextStyle.copyWith(
                            wordSpacing: 0,
                            fontWeight: FontWeight.bold,
                            color: kBlueColor,
                            fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      );
                    } else {
                      return Text(
                        "",
                        style: mainTextStyle.copyWith(
                            wordSpacing: 0,
                            fontWeight: FontWeight.bold,
                            color: kBlueColor,
                            fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSettingDrawerMenuWidget(
                    Icons.person, "Info Detail", false, () {}),
                CustomSettingDrawerMenuWidget(
                    Icons.settings, "Pengaturan", false, () {}),
                CustomSettingDrawerMenuWidget(Icons.logout, "Log Out", false,
                    () {
                  showAlertDialog();
                }),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        floatingActionButton: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return FloatingActionButton(
                backgroundColor: isEditable ? kBlueColor : kGreyColor,
                onPressed: () {
                  setState(() {
                    isEditable = true;
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      isEditable ? Icons.save : Icons.edit,
                      color: Colors.white,
                    ),
                    Text(
                      isEditable ? "Save" : "Edit",
                      style:
                          mainTextStyle.copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ));
          },
        ),
        drawer: settingsDrawer(),
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
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
                      "Profil",
                      style: mainTextStyle.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kBlueColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) {
                    if (state is SettingLoading) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is SettingInitial) {
                      BlocProvider.of<SettingCubit>(context)
                          .getEmployeeDetails(userModel: args);
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is SettingSuccess) {
                      _gender = state.employee.gender == "Male"
                          ? EnumGender.male
                          : EnumGender.female;

                      _maritalStatus = state.employee.martialStatus == "Married"
                          ? EnumMaritalStatus.married
                          : EnumMaritalStatus.single;

                      return RefreshIndicator(
                        onRefresh: () async {
                          isEditable = false;
                          BlocProvider.of<SettingCubit>(context).setInit();
                        },
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Text(
                                      "Data Diri",
                                      style: mainTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: isEditable
                                              ? kBlueColor
                                              : kDividerGreyColor),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: TextFormField(
                                      enabled: isEditable,
                                      cursorColor: kBlueColor,
                                      style: mainTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: isEditable
                                              ? kBlueColor
                                              : kDividerGreyColor),
                                      initialValue: state.employee.fullName,
                                      decoration: InputDecoration(
                                          labelText: 'Full Name',
                                          labelStyle: mainTextStyle.copyWith(
                                            color: kGreyColor,
                                          ),
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: isEditable
                                        ? kBlueColor
                                        : kDividerGreyColor,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: TextFormField(
                                      enabled: isEditable,
                                      cursorColor: kBlueColor,
                                      style: mainTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: isEditable
                                              ? kBlueColor
                                              : kDividerGreyColor),
                                      initialValue: state.employee.employeeId,
                                      decoration: InputDecoration(
                                          labelText: 'Employee Id',
                                          labelStyle: mainTextStyle.copyWith(
                                            color: kGreyColor,
                                          ),
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: isEditable
                                        ? kBlueColor
                                        : kDividerGreyColor,
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Gender",
                                            style: mainTextStyle.copyWith(
                                                color: kGreyColor),
                                          ),
                                          Row(
                                            children: [
                                              Radio<EnumGender>(
                                                value: EnumGender.male,
                                                groupValue: _gender,
                                                onChanged: isEditable
                                                    ? (EnumGender? value) {
                                                        setState(() {
                                                          _gender = value;
                                                        });
                                                      }
                                                    : null,
                                              ),
                                              Text(
                                                "Male",
                                                style: mainTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: isEditable
                                                        ? kBlueColor
                                                        : kDividerGreyColor),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Radio<EnumGender>(
                                                value: EnumGender.female,
                                                groupValue: _gender,
                                                onChanged: isEditable
                                                    ? (EnumGender? value) {
                                                        setState(() {
                                                          _gender = value;
                                                        });
                                                      }
                                                    : null,
                                              ),
                                              Text(
                                                "Female",
                                                style: mainTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: isEditable
                                                        ? kBlueColor
                                                        : kDividerGreyColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Divider(
                                    height: 1,
                                    color: isEditable
                                        ? kBlueColor
                                        : kDividerGreyColor,
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Gender",
                                            style: mainTextStyle.copyWith(
                                                color: kGreyColor),
                                          ),
                                          DropdownButtonFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none)),
                                            value: _maritalStatus,
                                            items: <
                                                DropdownMenuItem<
                                                    EnumMaritalStatus>>[
                                              DropdownMenuItem(
                                                value: EnumMaritalStatus.single,
                                                child: Text(
                                                  EnumMaritalStatus.single.text,
                                                  style: mainTextStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: isEditable
                                                          ? kBlueColor
                                                          : kGreyColor),
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value:
                                                    EnumMaritalStatus.married,
                                                child: Text(
                                                    EnumMaritalStatus
                                                        .married.text,
                                                    style:
                                                        mainTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: isEditable
                                                                ? kBlueColor
                                                                : kGreyColor)),
                                              ),
                                            ],
                                            onChanged: isEditable
                                                ? (value) {
                                                    setState(() {
                                                      _maritalStatus = value
                                                          as EnumMaritalStatus;
                                                    });
                                                  }
                                                : null,
                                          ),
                                        ],
                                      )),
                                  Divider(
                                    height: 1,
                                    color: isEditable
                                        ? kBlueColor
                                        : kDividerGreyColor,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text('You have an error'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        )));
  }
}

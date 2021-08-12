import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';
import 'package:pgone_apps/widget/custom_leaves_textFieldForm.dart';

class LeavesNewView extends StatelessWidget {
  const LeavesNewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Container(
          color: Colors.white,
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
                        size: 45,
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
                      "Apply Leaves",
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
                  child: ListView(
                    children: [
                      CustomLeavesTextFieldWidget(
                        color: kBlueColor,
                        hintText: "Username",
                        margin:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                        obscureText: false,
                        icon: Icons.person,
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

import 'package:flutter/material.dart';
import '../shared/theme.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Image.asset("assets/images/splash-screen.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Fleksibilitas Karyawan",
                  style: mainTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: kBlueColor),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Lakukan pekerjaan administrasi HR-mu kapanpun dan dimanapun",
                  style: mainTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff579FFF)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                    height: 50,
                    width: 240,
                    decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/SignIn", (route) => false);
                      },
                      child: Text(
                        "AYO MULAI !",
                        style: mainTextStyle.copyWith(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

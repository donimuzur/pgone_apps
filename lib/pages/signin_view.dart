import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgone_apps/cubit/auth_cubit.dart';

import 'package:pgone_apps/widget/custom_login_textfieldform.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../shared/theme.dart';

class SignInView extends StatelessWidget {
  final TextEditingController userNameController =
      new TextEditingController(text: "");
  final TextEditingController passwordController =
      new TextEditingController(text: "");
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PG",
                  style: mainTextStyle.copyWith(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "One",
                  style: mainTextStyle.copyWith(
                      fontSize: 45,
                      color: Color(0xffBEBEBE),
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
            SizedBox(
              height: 50,
            ),
            CustomLoginTextFieldWidget(
              controller: userNameController,
              color: kBlueColor,
              width: double.infinity,
              height: 50,
              hintText: "Username",
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              obscureText: false,
              icon: Icons.person,
            ),
            CustomLoginPasswordTexFieldWidget(
                controller: passwordController,
                color: kBlueColor,
                width: double.infinity,
                height: 50,
                hintText: "Password",
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                obscureText: true,
                icon: Icons.lock),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/Home", (route) => false,
                        arguments: state.user);
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff579FFF)),
                      child: Center(
                          child: SpinKitCircle(
                        color: Colors.white,
                      )),
                    );
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff579FFF),
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().signIn(
                          username: userNameController.text,
                          password: passwordController.text);
                    },
                    child: Text(
                      "Sign In",
                      style: mainTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot your password ?",
                        style: mainTextStyle.copyWith(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up!",
                        style: mainTextStyle.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:pgone_apps/cubit/auth_cubit.dart';
import 'package:pgone_apps/cubit/empbirthday_cubit.dart';
import 'package:pgone_apps/cubit/setting_cubit.dart';
import 'package:pgone_apps/pages/attendance_view.dart';
import 'package:pgone_apps/pages/checkinout_view.dart';
import 'package:pgone_apps/pages/leaves_new_view.dart';
import 'package:pgone_apps/pages/leaves_view.dart';
import 'package:pgone_apps/pages/main_view.dart';
import 'package:pgone_apps/pages/setting_view.dart';
import 'package:pgone_apps/pages/signin_view.dart';
import 'package:pgone_apps/pages/splash_view.dart';
import 'package:pgone_apps/pages/started_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'id';
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(create: (context) => EmpbirthdayCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('id', 'ID'),
        ],
        locale: const Locale('id', 'ID'),
        routes: {
          '/': (context) => SplashView(),
          '/GetStarted': (context) => GetStartedView(),
          '/SignIn': (context) => SignInView(),
          '/Setting': (context) => SettingView(),
          '/Home': (context) => MainView(),
          '/CheckInOut': (context) => CheckInOutView(),
          '/Attendance': (context) => AttendanceView(),
          '/Cuti': (context) => LeavesView(),
          '/AddNewCuti': (context) => LeavesNewView(),
        },
      ),
    );
  }
}

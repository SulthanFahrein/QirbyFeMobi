import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ta_1/config/app_color.dart';
import 'package:test_ta_1/config/app_route.dart';
import 'package:test_ta_1/page/change_pass.dart';
import 'package:test_ta_1/page/detail_page.dart';
import 'package:test_ta_1/page/detail_schedule_page.dart';
import 'package:test_ta_1/page/edit_profile.dart';
import 'package:test_ta_1/page/filter_page.dart';
import 'package:test_ta_1/page/maps_page.dart';
import 'package:test_ta_1/page/schedule.dart';
import 'package:test_ta_1/page/schedule_success_page.dart';
import 'package:test_ta_1/page/favorite_page.dart';
import 'package:test_ta_1/page/history_page.dart';
import 'package:test_ta_1/page/home_page.dart';
import 'package:test_ta_1/page/intro_page.dart';
import 'package:test_ta_1/page/notification_page.dart';
import 'package:test_ta_1/page/profile_page.dart';
import 'package:test_ta_1/page/signin_page.dart';
import 'package:test_ta_1/page/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backGroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 255, 255, 255),
          secondary: AppColor.secondary,
        ),
      ),
      routes: {
        '/': (context) => const IntroPage(),
        AppRoute.signin: (context) =>  SigninPage(),
        AppRoute.intro: (context) =>  const IntroPage(),
        AppRoute.signup: (context) =>  SignupPage(),
        AppRoute.home: (context) =>  HomePage(),
        AppRoute.history: (context) =>  const HistoryPage(),
        AppRoute.profile: (context) =>  ProfilePage(),
        AppRoute.favorite: (context) =>  FavoritePage(),
        AppRoute.notif: (context) => Notif(),
        AppRoute.schedulesuccess: (context) => const ScheduleSuccessPage(),
        AppRoute.schedule: (context) =>  Schedule(),
        AppRoute.maps: (context) => const MapsPage(),
        AppRoute.editprofile: (context) => EditProfile(),
        AppRoute.detailpage: (context) => DetailPage(),
        AppRoute.detailschedule: (context) => DetailSchedule(),
        AppRoute.filter: (context) => FilterPage(),
        AppRoute.changepass: (context) => ChangePass(),
      },

    );
  }
}

import 'package:smg_buddy_app/modules/dashboard/view/calender_view.dart';
import 'package:smg_buddy_app/modules/dashboard/view/dashboard_view.dart';
import 'package:smg_buddy_app/modules/language_selector/view/language_select.dart';
import 'package:smg_buddy_app/modules/otp_verify/view/otp_verify.dart';
import 'package:smg_buddy_app/modules/splash/views/splash_page.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/modules/login_page/view/login_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(name: Routes.login, page: () =>  LoginView()),
    GetPage(name: Routes.otpverify, page: () =>  OtpVerification()),
    GetPage(name: Routes.language, page: () =>  LanguageSelect()),
    GetPage(name: Routes.dashboard, page: () =>  DashboardView()),
    GetPage(name: Routes.calendar, page: () =>  CalendarView()),
  ];
}

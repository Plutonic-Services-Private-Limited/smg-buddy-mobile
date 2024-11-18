import 'package:buddy_app/modules/splash/views/splash_page.dart';
import 'package:get/get.dart';
import 'package:buddy_app/modules/login-page/view/loginView.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(name: Routes.login, page: () =>  LoginView()),
  ];
}

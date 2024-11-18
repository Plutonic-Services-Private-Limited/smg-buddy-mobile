
import 'package:buddy_app/routes/app_pages.dart';
import 'package:buddy_app/utils/storage.dart';
import 'package:get/get.dart';

class AppUtils {
  static logout() {
    Storage.clear();
    Get.offAllNamed(Routes.login);
  }

  static bool isLoggedIn() => Storage.token != null && Storage.token != "";
}

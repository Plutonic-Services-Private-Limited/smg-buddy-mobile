import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/utils/app_utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    if (AppUtils.isLoggedIn()) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(Routes.dashboard),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(Routes.login),
      );
    }
    super.onInit();
  }
}

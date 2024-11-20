import 'package:get/get.dart';
import 'package:smg_buddy_app/utils/storage.dart';

class LanguageController extends GetxController{
  final languageOptions = [
    {"name": "English", "code": "en"},
    {"name": "हिन्दी", "code": "hi"}
  ];
  int selectedLanguage=0;
  @override
  void onInit() {
    for (var i = 0; i < languageOptions.length; i++) {
      if (languageOptions[i]['code'] == Storage.language) {
        selectedLanguage = i;
      }
    }
    super.onInit();
  }
}

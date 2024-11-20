
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smg_buddy_app/app/app_view.dart';
import 'package:smg_buddy_app/languages/app-translations.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/utils/storage.dart';
import '../flavors.dart';
import 'app_binding.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Storage.language ??= 'en';
    return GetMaterialApp(
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate
      ],
      title: F.title,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      home: const AppView(),
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
      builder: EasyLoading.init(),
      supportedLocales: const [Locale('en', ''), Locale('hi', '')],
      locale: Locale(Storage.language ?? 'en', ''),
      translationsKeys: AppTranslations.translations,
    );
  }
}

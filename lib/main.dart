import 'package:smg_buddy_app/app/app.dart';
import 'package:smg_buddy_app/utils/flavor_utils.dart';
import 'package:smg_buddy_app/utils/storage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  const env = String.fromEnvironment('ENV');
  Env.appFlavor = Env.fromRawValue(env.toLowerCase());
  await Storage.init();

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const App());
  });
}
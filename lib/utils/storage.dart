import 'package:smg_buddy_app/constants/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

import 'network_requester.dart';

class Storage {
  Storage._privateConstructor();

  static GetStorage? box;

  static Future<bool> init() async {
    final result = await GetStorage.init();
    box = GetStorage();
    return result;
  }
  static String? get language => box?.read(StorageKeys.language);

  static set language(String? value) => box?.write(StorageKeys.language, value);

  // Api key
  static String? get token => box?.read(StorageKeys.token);

  static set token(String? value) => box?.write(StorageKeys.token, value);

  static clear() {
    box?.erase();
    NetworkRequester.shared.prepareRequest();
  }
}

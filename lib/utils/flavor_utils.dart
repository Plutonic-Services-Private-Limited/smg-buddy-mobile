import 'package:flutter/material.dart';

import '../flavors.dart';

class Env {
  static Flavor appFlavor = Flavor.dev;
  static String flavorName = 'dev';

  static Color _primaryColor = const Color.fromRGBO(167, 1, 0, 1);
  static Color _secondaryColor = const Color.fromRGBO(0, 0, 0, 1);

  static Color get primaryColor {
    switch (appFlavor) {
      case Flavor.dev:
        return const Color.fromRGBO(167, 1, 0, 1);
      case Flavor.stage:
        return const Color.fromRGBO(167, 1, 0, 1);
      case Flavor.prod:
        return const Color.fromRGBO(167, 1, 0, 1);
      default:
        return _primaryColor;
    }
  }

  static Color get secondaryColor {
    switch (appFlavor) {
      case Flavor.dev:
        return const Color.fromRGBO(0, 0, 0, 1);
      case Flavor.stage:
        return const Color.fromRGBO(0, 0, 0, 1);
      case Flavor.prod:
        return const Color.fromRGBO(0, 0, 0, 1);
      default:
        return _secondaryColor;
    }
  }

  static set primaryColor(Color value) {
    _primaryColor = value;
  }

  static set secondaryColor(Color value) {
    _secondaryColor = value;
  }

  static String get baseURL {
    return "$baseDomain/super_admin_console/public/api/";
  }

  static String get mediaURL {
    return "$baseDomain/media/";
  }

  static Flavor fromRawValue(String value) {
    flavorName = value;
    for (var flavor in Flavor.values) {
      if ('Flavor.$value' == flavor.toString()) {
        return flavor;
      }
    }
    return Flavor.dev;
  }

  static String get baseDomain {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://staging.api.storemygoods.in';
      case Flavor.stage:
        return 'https://staging.api.storemygoods.in';
      case Flavor.prod:
        return 'https://erp.chaitanyaprojects.com';
      default:
        return 'https://nix.plutonic.co.in';
    }
  }
}

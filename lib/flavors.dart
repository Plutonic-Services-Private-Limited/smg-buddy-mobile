enum Flavor {
  dev,
  stage,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'DEV';
      case Flavor.stage:
        return 'Buddy Staging';
      case Flavor.prod:
        return 'SMG Buddy';
      default:
        return 'title';
    }
  }

}

enum Flavor {
  dev,
  stage,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Hit Notes Dev';
      case Flavor.stage:
        return 'Hit Notes Stage';
      case Flavor.prod:
        return 'Hit Notes';
      default:
        return 'title';
    }
  }
}

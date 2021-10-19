enum Flavor {
  dev,
  stage,
  prod,
}

// ignore: avoid_classes_with_only_static_members
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
      case null:
        return 'title';
    }
  }
}

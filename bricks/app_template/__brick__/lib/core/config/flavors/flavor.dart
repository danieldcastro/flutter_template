enum Flavor {
  qa,
  prod;

  bool get isProd => this == Flavor.prod;

  String get appTitle {
    switch (this) {
      case Flavor.qa:
        return '[QA] ';
      case Flavor.prod:
        return '';
    }
  }
}

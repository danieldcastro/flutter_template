enum FlavorEnum {
  qa,
  prod;

  bool get isProd => this == FlavorEnum.prod;

  String get appTitle {
    switch (this) {
      case FlavorEnum.qa:
        return '[QA] {{app_name}}';
      case FlavorEnum.prod:
        return '{{app_name}}';
    }
  }
}

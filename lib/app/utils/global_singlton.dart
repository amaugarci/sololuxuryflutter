class GlobalSingleton {
  static final GlobalSingleton globalSingleton = GlobalSingleton._internal();

  factory GlobalSingleton() {
    return globalSingleton;
  }

  GlobalSingleton._internal();
  String? deviceToken;
}

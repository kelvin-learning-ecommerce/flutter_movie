class Env {
  Env._();

  static late EnvData _env;

  static EnvData get data => _env;

  static late EnvType _type;

  static EnvType get type => _type;

  static void init(EnvType env) {
    switch (env) {
      case EnvType.development:
        _env = Env._dev;
        _type = EnvType.development;
        break;
      case EnvType.production:
        _env = Env._prod;
        _type = EnvType.production;
        break;
      default:
    }
  }

  static var betaHeadUrl = "https://beta.westpointgroup.sg";
  static var liveHeadUrl = "https://westpointgroup.sg";

  static final EnvData _dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    title: "Westpoint dev",
    apiUrl: betaHeadUrl,
    androidPackageName: "com.automotive.westpoint.dev",
    iosBundleId: "com.automotive.westpoint.dev",
    //TODO: wait for dev tobe up to appstore
    iosAppStoreId: "",
  );

  static final EnvData _prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    title: "Westpoint",
    apiUrl: liveHeadUrl,
    androidPackageName: "com.automotive.westpoint",
    iosBundleId: "com.automotive.westpoint",
    iosAppStoreId: "1643450495",
  );
}

enum EnvType { development, production }

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final String title;
  final String apiUrl;
  final String androidPackageName;
  final String iosBundleId;
  final String iosAppStoreId;

  EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.title,
    required this.apiUrl,
    required this.androidPackageName,
    required this.iosBundleId,
    required this.iosAppStoreId,
  });
}

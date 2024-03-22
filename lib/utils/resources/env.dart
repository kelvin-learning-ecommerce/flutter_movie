import '../constants/service_url.dart';

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

  static final EnvData _dev = EnvData(
    title: "DEV Movie Challenge",
    apiUrl: devBaseUrl,
    androidPackageName: "com.movie.kelvin.dev",
    iosBundleId: "com.movie.kelvin.dev",
    iosAppStoreId: "",
  );

  static final EnvData _prod = EnvData(
    title: "Movie Challenge",
    apiUrl: prodBaseUrl,
    androidPackageName: "com.movie.kelvin",
    iosBundleId: "com.movie.kelvin",
    iosAppStoreId: "",
  );
}

enum EnvType { development, production }

class EnvData {
  final String title;
  final String apiUrl;
  final String androidPackageName;
  final String iosBundleId;
  final String iosAppStoreId;

  EnvData({
    required this.title,
    required this.apiUrl,
    required this.androidPackageName,
    required this.iosBundleId,
    required this.iosAppStoreId,
  });
}

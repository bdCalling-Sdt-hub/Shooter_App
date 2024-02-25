import 'package:get/get.dart';
import 'package:shooter_app/views/screens/splashScreen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen.dart";
  static const String nftMarketplaceScreen = "/nft_marketplace_screen.dart";

  static List<GetPage> get routes => [
        GetPage(name: splashScreen, page: () => SplashScreen()),
      ];
}

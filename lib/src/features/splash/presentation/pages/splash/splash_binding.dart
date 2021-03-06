import 'package:get/get.dart';
import 'package:testeliteflower/src/injection_container.dart';

import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut<SplashController>(() => SplashController(
          getTheme: sl(),
          setLanguage: sl(),
          getLanguage: sl(),
        ));
  }
}

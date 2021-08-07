import 'package:get/get.dart';
import 'package:testeliteflower/src/injection_container.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.put<HomeController>(HomeController(
      setTheme: sl(),
      setLanguage: sl(),
      getCountry: sl(),
      saveCountry: sl(),
    ));
  }
}

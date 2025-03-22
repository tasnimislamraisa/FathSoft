import 'package:task_1_ios_app/my-imports.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(Logger());
    Get.put(NetworkCaller(
      logger: Get.find<Logger>(),
      authController: Get.find<AuthController>(),
    ));
    Get.put(AuthController());
    Get.put(BottomNavbarController());
  }
}

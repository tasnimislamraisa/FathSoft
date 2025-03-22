import 'package:task_1_ios_app/my-imports.dart';

class BottomNavbarController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index < 0 || index >= 4) {
      Get.snackbar(
        'Error',
        'Invalid tab selection',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    _selectedIndex = index;
    update();
  }

  void selectCategoryTab() {
    changeIndex(1);
  }

  void selectProductTab() {
    changeIndex(3);
  }

  void backToHome() {
    changeIndex(0);
  }
}

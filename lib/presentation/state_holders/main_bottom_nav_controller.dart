import 'auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;
  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if(_selectedIndex == index) {
      return;
    }

    if((_selectedIndex == 2 || _selectedIndex == 3) && Get.find<AuthController>().token == null) {
      AuthController().goToLogin();
      return;
    }

    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }

}
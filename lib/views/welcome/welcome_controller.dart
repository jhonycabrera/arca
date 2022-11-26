import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void goToLoginPage() {
    Get.toNamed('/login');
  }
}

import 'package:get/get.dart'; 

class LoginController extends GetxController {
  final username = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  void login() {
    isLoading.value = true;

    // simulate authentication
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      if (username.value == 'admin' && password.value == 'admin123') {
        Get.offAllNamed('/dashboard');
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    });
  }
}

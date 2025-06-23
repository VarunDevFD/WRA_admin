import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;
  final RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    if (email == 'admin@rental.com' && password == 'admin123') {
      isLoggedIn.value = true;
      Get.offAllNamed('/dashboard');
    } else { 
      Get.snackbar('Error', 'Invalid credentials');
    }
    isLoading.value = false;
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }
}

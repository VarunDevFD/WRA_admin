import 'package:get/get.dart';

class SettingsController extends GetxController {
  var selectedMenuItem = 'settings'.obs;
  
  void selectMenuItem(String menuItem) {
    selectedMenuItem.value = menuItem;
  }
}
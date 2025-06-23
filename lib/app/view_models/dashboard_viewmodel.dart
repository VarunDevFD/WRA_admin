import 'package:get/get.dart';

class DashboardViewModel {
  RxList<String> users = <String>[].obs;

  void loadUsers() {
    users.value = ['User A', 'User B', 'User C'];
  }
}

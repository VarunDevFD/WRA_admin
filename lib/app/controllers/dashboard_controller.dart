import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt totalItems = 0.obs;
  final RxInt totalCustomers = 0.obs;
  final RxInt activeBookings = 0.obs;
  final RxDouble monthlyRevenue = 0.0.obs;
  final RxList<Map<String, dynamic>> recentActivities =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  void loadDashboardData() {
    // Simulate loading dashboard data
    totalItems.value = 156;
    totalCustomers.value = 89;
    activeBookings.value = 23;
    monthlyRevenue.value = 12450.0;

    recentActivities.value = [
      {'action': 'New booking created', 'time': '5 minutes ago'},
      {'action': 'Camera equipment returned', 'time': '1 hour ago'},
      {'action': 'New customer registered', 'time': '2 hours ago'},
      {'action': 'Wedding dress booked', 'time': '3 hours ago'},
    ];
  }
}

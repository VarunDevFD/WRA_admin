import 'package:flutter/material.dart';
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

  String getCardImage(int index) {
    const images = [
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1542744094-3a31f272c490?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1593642532973-d31b6557fa68?auto=format&fit=crop&w=800&q=80'
    ];
    return images[index % images.length];
  }

  void loadDashboardData() {
    // Simulate loading dashboard data
    totalItems.value = 156;
    totalCustomers.value = 89;
    activeBookings.value = 23;
    monthlyRevenue.value = 12450.0;

    recentActivities.value = [
      {'action': 'New booking created', 'time': '5 minutes ago'},
      {'action': 'Returned item', 'time': '1 hour ago'},
      {'action': 'New customer registered', 'time': '2 hours ago'},
      {'action': 'New Comer', 'time': '3 hours ago'},
      {'action': 'Pending Payments', 'time': '1 hours ago'},
    ];
  }

  String adminEmail = "admin@example.com";

  // Example list of notifications
  RxList<String> notifications = <String>[
    'New booking received',
    'Service provider updated details',
    'Payment confirmed',
  ].obs;

  void markAllAsRead() {
    notifications.clear();
  }

  void markAsDone(int index) {
    notifications.removeAt(index);
  }

  // Method to get time-based greeting
  String getTimeBasedGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  // Method to get appropriate icon based on time
  IconData getTimeBasedIcon() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return Icons.wb_sunny; // Morning sun
    } else if (hour >= 12 && hour < 17) {
      return Icons.wb_sunny_outlined; // Afternoon sun
    } else if (hour >= 17 && hour < 21) {
      return Icons.wb_twilight; // Evening
    } else {
      return Icons.nights_stay; // Night moon
    }
  }

  // Method to get time-based colors
  List<Color> getTimeBasedColors() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      // Morning - warm yellow/orange gradient
      return [Color(0xFFFFB347), Color(0xFFFF6B6B)];
    } else if (hour >= 12 && hour < 17) {
      // Afternoon - bright blue gradient
      return [Color(0xFF4FC3F7), Color(0xFF29B6F6)];
    } else if (hour >= 17 && hour < 21) {
      // Evening - purple/pink gradient
      return [Color(0xFF667eea), Color(0xFF764ba2)];
    } else {
      // Night - dark blue/purple gradient
      return [Color(0xFF2C3E50), Color(0xFF4A569D)];
    }
  }
}

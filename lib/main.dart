import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wdr/app/controllers/analytics.dart';
import 'package:wdr/app/controllers/auth_controller.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';
import 'package:wdr/app/controllers/rental_controller.dart';
import 'package:wdr/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    Get.put(AuthController());
    Get.put(DashboardController());
    Get.put(RentalController());
    Get.put(AnalyticsController());

    return GetMaterialApp(
      title: 'Rental Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

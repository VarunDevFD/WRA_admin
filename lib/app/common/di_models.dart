import 'package:get/get.dart'; 
import 'package:wdr/app/controllers/analytics.dart';
import 'package:wdr/app/controllers/auth_controller.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

void di() {
   Get.put(AuthController());
    Get.put(DashboardController());
    Get.put(ProductsController());
    Get.put(AnalyticsController());

}
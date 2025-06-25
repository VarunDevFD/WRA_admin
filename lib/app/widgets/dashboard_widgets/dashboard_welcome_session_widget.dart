import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';

class WelcomeSectionWidget extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  WelcomeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: controller.getTimeBasedColors(),
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: controller.getTimeBasedColors()[0].withAlpha(77),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(controller.getTimeBasedIcon(),
                        color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Text(
                      '${controller.getTimeBasedGreeting()}, Admin!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Welcome to Your Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xE6FFFFFF),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Monitor your rental business performance and manage your inventory efficiently.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xCCFFFFFF),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed('/add-rental'),
                  icon: Icon(Icons.add),
                  label: Text('Add New Item'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: controller.getTimeBasedColors()[0],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0x1AFFFFFF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0x33FFFFFF),
                width: 1,
              ),
            ),
            child: Icon(Icons.trending_up, size: 60, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

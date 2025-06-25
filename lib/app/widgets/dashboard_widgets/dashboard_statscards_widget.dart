import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';

class StatsCards extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: _statsCard(
              'Total Items',
              controller.totalItems.value.toString(),
              Icons.inventory_2_outlined,
              Colors.blue,
              '+12%',
              0,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: _statsCard(
              'Total Customers',
              controller.totalCustomers.value.toString(),
              Icons.people_outline,
              Colors.green,
              '+8%',
              1,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: _statsCard(
              'Active Bookings',
              controller.activeBookings.value.toString(),
              Icons.book_online_outlined,
              Colors.orange,
              '+15%',
              2,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: _statsCard(
              'Monthly Revenue',
              '\$${controller.monthlyRevenue.value.toStringAsFixed(0)}',
              Icons.attach_money,
              Colors.purple,
              '+22%',
              3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String change,
    int cardIndex,
  ) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.network(
              controller.getCardImage(cardIndex),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),

            // Blur Effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Color(0x4D000000),
              ),
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x80000000), // 0.5 opacity black
                    Color(0x4D000000), // 0.3 opacity black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Card Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              controller.getTimeBasedColors()[0].withAlpha(204),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(icon, color: Colors.white, size: 22),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0x3369F0AE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          change,
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Color(0x80000000),
                                offset: Offset(0, 1),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Main Value
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Color(0x99000000),
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4),

                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          color: Color(0x66000000),
                          offset: Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

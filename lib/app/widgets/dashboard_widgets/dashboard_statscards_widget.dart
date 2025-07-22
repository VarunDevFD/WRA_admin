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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    // Responsive padding, spacing, and font sizes
    final double padding = isMobile
        ? 12.0
        : isTablet
            ? 16.0
            : 20.0;
    final double spacing = isMobile
        ? 12.0
        : isTablet
            ? 16.0
            : 20.0;
    final double cardHeight = isMobile
        ? 140.0
        : isTablet
            ? 160.0
            : 180.0;
    final double valueFontSize = isMobile
        ? 22.0
        : isTablet
            ? 26.0
            : 28.0;
    final double titleFontSize = isMobile
        ? 12.0
        : isTablet
            ? 13.0
            : 14.0;

    return Obx(
      () => isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _statsCard(
                  'Total Items',
                  controller.totalItems.value.toString(),
                  Icons.inventory_2_outlined,
                  Colors.blue,
                  '+12%',
                  0,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                SizedBox(height: spacing),
                _statsCard(
                  'Total Customers',
                  controller.totalCustomers.value.toString(),
                  Icons.people_outline,
                  Colors.green,
                  '+8%',
                  1,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                SizedBox(height: spacing),
                _statsCard(
                  'Active Bookings',
                  controller.activeBookings.value.toString(),
                  Icons.book_online_outlined,
                  Colors.orange,
                  '+15%',
                  2,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                SizedBox(height: spacing),
                _statsCard(
                  'Monthly Revenue',
                  '\$${controller.monthlyRevenue.value.toStringAsFixed(0)}',
                  Icons.attach_money,
                  Colors.purple,
                  '+22%',
                  3,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
              ],
            )
          : Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                _statsCard(
                  'Total Items',
                  controller.totalItems.value.toString(),
                  Icons.inventory_2_outlined,
                  Colors.blue,
                  '+12%',
                  0,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                _statsCard(
                  'Total Customers',
                  controller.totalCustomers.value.toString(),
                  Icons.people_outline,
                  Colors.green,
                  '+8%',
                  1,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                _statsCard(
                  'Active Bookings',
                  controller.activeBookings.value.toString(),
                  Icons.book_online_outlined,
                  Colors.orange,
                  '+15%',
                  2,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
                ),
                _statsCard(
                  'Monthly Revenue',
                  '\$${controller.monthlyRevenue.value.toStringAsFixed(0)}',
                  Icons.attach_money,
                  Colors.purple,
                  '+22%',
                  3,
                  cardHeight,
                  valueFontSize,
                  titleFontSize,
                  padding,
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
    double cardHeight,
    double valueFontSize,
    double titleFontSize,
    double padding,
  ) {
    return Container(
      width: 300, // Fixed width for Wrap layout (tablet/desktop)
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 12,
            offset: const Offset(0, 6),
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
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),

            // Blur Effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: const Color(0x4D000000),
              ),
            ),

            // Gradient Overlay
            Container(
              decoration: const BoxDecoration(
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
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(padding * 0.5),
                        decoration: BoxDecoration(
                          color:
                              controller.getTimeBasedColors()[0].withAlpha(204),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Icon(icon, color: Colors.white, size: padding + 2),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding * 0.4,
                          vertical: padding * 0.2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x3369F0AE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          change,
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: titleFontSize - 2,
                            fontWeight: FontWeight.w600,
                            shadows: const [
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

                  SizedBox(height: padding),

                  // Main Value
                  Flexible(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: valueFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            color: Color(0x99000000),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  SizedBox(height: padding * 0.2),

                  // Title
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        shadows: const [
                          Shadow(
                            color: Color(0x66000000),
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

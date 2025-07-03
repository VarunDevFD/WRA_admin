import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/analytics.dart';

class OverviewCards extends StatelessWidget {
  final controller = Get.find<AnalyticsController>();
  OverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Expanded(
              child: _buildOverviewCard(
                'Total Revenue',
                '\$${controller.monthlyRevenue.fold(0.0, (sum, revenue) => sum + revenue).toStringAsFixed(0)}',
                Icons.trending_up,
                Colors.green,
                '+12.5%',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildOverviewCard(
                'Monthly Growth',
                '+${((controller.monthlyRevenue.isNotEmpty ? controller.monthlyRevenue.last / controller.monthlyRevenue.first : 1.0) * 100 - 100).toStringAsFixed(1)}%',
                Icons.show_chart,
                Colors.blue,
                '+8.2%',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildOverviewCard(
                'Top Category',
                'Decoration',
                Icons.category,
                Colors.purple,
                '32% share',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildOverviewCard(
                'Customer Satisfaction',
                '4.8/5.0',
                Icons.star,
                Colors.orange,
                '+0.3',
              ),
            ),
          ],
        ));
  }

  Widget _buildOverviewCard(
      String title, String value, IconData icon, Color color, String change) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

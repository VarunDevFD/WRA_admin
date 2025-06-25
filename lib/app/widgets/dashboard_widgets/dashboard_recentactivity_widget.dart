import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';

class RecentActivity extends StatelessWidget {
  final DashboardController controller = Get.find<DashboardController>();
  RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('View All'),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 350,
            child: Obx(() => ListView.builder(
                  itemCount: controller.recentActivities.length,
                  itemBuilder: (context, index) {
                    final activity = controller.recentActivities[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0x1A667EEA),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              _getActivityIcon(activity['action']),
                              color: Color(0xFF667eea),
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activity['action'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                Text(
                                  activity['time'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  IconData _getActivityIcon(String action) {
    if (action.contains('booking')) return Icons.book_online;
    if (action.contains('returned')) return Icons.assignment_return;
    if (action.contains('customer')) return Icons.person_add;
    if (action.contains('booked')) return Icons.event_available;
    return Icons.notifications;
  }
}

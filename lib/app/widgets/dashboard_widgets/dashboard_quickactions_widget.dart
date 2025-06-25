import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

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
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 20),
          _quickActionButton(
            'Products Management',
            Icons.add_circle_outline,
            Color(0xFF667eea),
            () => Get.toNamed('/add-rental'),
          ),
          SizedBox(height: 12),
          _quickActionButton(
            'View All Bookings',
            Icons.book_online,
            Colors.green,
            () => Get.toNamed('/bookings'),
          ),
          SizedBox(height: 12),
          _quickActionButton(
            'Customer Management',
            Icons.people,
            Colors.orange,
            () => Get.toNamed('/customers'),
          ),
          SizedBox(height: 12),
          _quickActionButton(
            'Analytics Report',
            Icons.analytics,
            Colors.purple,
            () => Get.toNamed('/analytics'),
          ),
        ],
      ),
    );
  }

  Widget _quickActionButton(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x4D000000)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0x1A000000),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

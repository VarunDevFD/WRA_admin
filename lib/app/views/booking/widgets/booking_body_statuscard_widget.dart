import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/models/booking.dart';

class StatusCards extends StatelessWidget {
  final List<Booking> bookings = Get.find<BookingController>().bookings;

  StatusCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final activeBookings = bookings.where((b) => b.status == 'Active').length;
      final completedBookings =
          bookings.where((b) => b.status == 'Completed').length;
      final totalRevenue =
          bookings.fold(0.0, (sum, booking) => sum + booking.totalAmount);
      final pendingPayments = bookings
          .where((b) => b.status == 'Pending')
          .fold(0.0, (sum, booking) => sum + booking.totalAmount);

      return Row(
        children: [
          Expanded(
            child: _buildStatusCard('Active Bookings',
                activeBookings.toString(), Colors.blue, Icons.pending),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard('Completed', completedBookings.toString(),
                Colors.green, Icons.check_circle),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard(
                'Total Revenue',
                '\$${totalRevenue.toStringAsFixed(2)}',
                Colors.purple,
                Icons.attach_money),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatusCard(
              'Pending Payments',
              '\$${pendingPayments.toStringAsFixed(2)}',
              Colors.red,
              Icons.pending_actions_rounded,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildStatusCard(
      String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 30),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
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
      ),
    );
  }
}

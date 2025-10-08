import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/models/booking.dart';

class StatusCards extends StatelessWidget {
  final bool isMobile;
  final List<Booking> bookings = Get.find<BookingController>().bookings;

  StatusCards({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final activeBookings = bookings.where((b) => b.status == 'Active').length;
      final completedBookings =
          bookings.where((b) => b.status == 'Completed').length;
      final totalRevenue =
          bookings.fold(0.0, (sum, b) => sum + b.totalAmount);
      final pendingPayments = bookings
          .where((b) => b.status == 'Pending')
          .fold(0.0, (sum, b) => sum + b.totalAmount);

      final cards = [
        _buildStatusCard('Active', activeBookings.toString(), Colors.blue, Icons.pending),
        _buildStatusCard('Completed', completedBookings.toString(), Colors.green, Icons.check_circle),
        _buildStatusCard('Revenue', '\$${totalRevenue.toStringAsFixed(2)}', Colors.purple, Icons.attach_money),
        _buildStatusCard('Pending', '\$${pendingPayments.toStringAsFixed(2)}', Colors.red, Icons.pending_actions),
      ];

      return isMobile
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: cards.map((c) => SizedBox(width: 200, child: c)).toList()),
            )
          : Row(children: cards.map((c) => Expanded(child: c)).toList());
    });
  }

  Widget _buildStatusCard(String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

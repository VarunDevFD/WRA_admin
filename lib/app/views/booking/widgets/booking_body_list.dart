import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/models/booking.dart';

class BookingsListView extends StatelessWidget {
  final List<Booking> bookings = Get.find<BookingController>().bookings;

  BookingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text("Booking #${booking.id} - ${booking.customerName}"),
                subtitle: Text(
                  "${booking.startDate.day}/${booking.startDate.month} → "
                  "${booking.endDate.day}/${booking.endDate.month}\n"
                  "Status: ${booking.status}",
                ),
                trailing: Text("\$${booking.totalAmount.toStringAsFixed(2)}"),
                onTap: () {
                  // open details
                },
              ),
            );
          },
        ));
  }
}

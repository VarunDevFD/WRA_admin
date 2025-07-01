import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/models/booking.dart';

class BookingsTable extends StatelessWidget {
  final List<Booking> bookings = Get.find<BookingController>().bookings;
  BookingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.vertical, // Enable vertical scrolling
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width -
                  40, // Full width minus padding
            ),
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
              columnSpacing: 20, // Adjust spacing between columns
              columns: const [
                DataColumn(
                  label: Text('Booking ID',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Customer',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Start Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('End Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Amount',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Actions',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
              rows: bookings.map((booking) {
                return DataRow(
                  cells: [
                    DataCell(Text('#${booking.id}')),
                    DataCell(Text(booking.customerName)),
                    DataCell(Text(
                        '${booking.startDate.day}/${booking.startDate.month}/${booking.startDate.year}')),
                    DataCell(Text(
                        '${booking.endDate.day}/${booking.endDate.month}/${booking.endDate.year}')),
                    DataCell(
                        Text('\$${booking.totalAmount.toStringAsFixed(2)}')),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: booking.status == 'Active'
                              ? Colors.blueGrey[50]
                              : booking.status == 'Completed'
                                  ? Colors.green[50]
                                  : Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          booking.status,
                          style: TextStyle(
                            color: booking.status == 'Active'
                                ? Colors.blue
                                : booking.status == 'Completed'
                                    ? Colors.green
                                    : Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'view',
                            child: Text('View Details'),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'cancel',
                            child: Text('Cancel'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'view') {
                            // Handle view action
                          } else if (value == 'edit') {
                            // Handle edit action
                          } else if (value == 'cancel') {
                            // Handle cancel action
                          }
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ));
  }
}

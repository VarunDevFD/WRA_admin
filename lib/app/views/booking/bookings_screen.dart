import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/views/booking/widgets/booking_body_statuscard_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_body_table_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_sidebar_session_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_topbar_session_widget.dart';
import '../../models/booking.dart';

class BookingsView extends StatelessWidget {
  final List<Booking> bookings =
      Get.put<BookingController>(BookingController()).bookings;
  BookingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarView(),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  TopBarView(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bookings',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 20),
                          StatusCards(),
                          SizedBox(height: 20),
                          Expanded(
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: BookingsTable(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:get/get.dart'; 
import 'package:wdr/app/models/booking.dart';

class BookingController extends GetxController {
  final RxList<Booking> bookings = <Booking>[
    Booking(
      id: '1',
      customerId: '1',
      customerName: 'John Doe',
      itemIds: ['1', '2'],
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 3)),
      totalAmount: 150.0,
      status: 'Active',
    ),
    Booking(
      id: '2',
      customerId: '2',
      customerName: 'Jane Smith',
      itemIds: ['3'],
      startDate: DateTime.now().subtract(Duration(days: 5)),
      endDate: DateTime.now().subtract(Duration(days: 2)),
      totalAmount: 200.0,
      status: 'Completed',
    ),
    Booking(
      id: '3',
      customerId: '3',
      customerName: 'JK Smith',
      itemIds: ['6'],
      startDate: DateTime.now().subtract(Duration(days: 6)),
      endDate: DateTime.now().subtract(Duration(days: 3)),
      totalAmount: 369.0,
      status: 'Pending',
    ),
  ].obs;
}
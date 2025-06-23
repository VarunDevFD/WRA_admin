import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/auth_controller.dart';
import '../../models/booking.dart';

class BookingsView extends StatelessWidget {
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
  ].obs;

  BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  _buildTopBar(),
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
                          _buildStatusCards(),
                          SizedBox(height: 20),
                          Expanded(
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: _buildBookingsTable(),
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

  Widget _buildSidebar() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2c3e50),
            Color(0xFF3498db),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.book_online, color: Colors.white, size: 32),
                ),
                SizedBox(height: 12),
                Text(
                  'Booking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Management',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                _sidebarItem(Icons.dashboard, 'Dashboard', '/dashboard'),
                _sidebarItem(Icons.inventory, 'Rentals', '/rentals'),
                _sidebarItem(Icons.people, 'Customers', '/customers'),
                _sidebarItem(Icons.book_online, 'Bookings', '/bookings',
                    isActive: true),
                _sidebarItem(Icons.analytics, 'Analytics', '/analytics'),
                _sidebarItem(Icons.settings, 'Settings', '/settings'),
                SizedBox(height: 20),
                Divider(color: Colors.white24),
                 
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Get.find<AuthController>().logout(),
                    icon: Icon(Icons.logout, size: 18),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      minimumSize: Size(0, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, String route,
      {bool isActive = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.toNamed(route),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.white.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isActive
                  ? Border.all(color: Colors.white.withOpacity(0.3))
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : Colors.white70,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white70,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Booking Management',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xFF667eea),
            child: Text('A', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCards() {
    return Obx(() {
      final activeBookings = bookings.where((b) => b.status == 'Active').length;
      final completedBookings =
          bookings.where((b) => b.status == 'Completed').length;
      final totalRevenue =
          bookings.fold(0.0, (sum, booking) => sum + booking.totalAmount);

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

  Widget _buildBookingsTable() {
    return Obx(() => SingleChildScrollView(
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
            columns: [
              DataColumn(
                  label: Text('Booking ID',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Customer',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Start Date',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('End Date',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Amount',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Actions',
                      style: TextStyle(fontWeight: FontWeight.bold))),
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
                  DataCell(Text('\$${booking.totalAmount.toStringAsFixed(2)}')),
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: booking.status == 'Active'
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        booking.status,
                        style: TextStyle(
                          color: booking.status == 'Active'
                              ? Colors.blue
                              : Colors.green,
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
        ));
  }
}

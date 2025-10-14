import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/booking_controller.dart';
import 'package:wdr/app/views/booking/widgets/booking_body_list.dart';
import 'package:wdr/app/views/booking/widgets/booking_body_statuscard_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_body_table_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_sidebar_session_widget.dart';
import 'package:wdr/app/views/booking/widgets/booking_topbar_session_widget.dart';
import 'package:wdr/app/views/booking/widgets/responsive_widget.dart';
import '../../models/booking.dart';

class BookingsView extends StatelessWidget {
  final List<Booking> bookings =
      Get.put<BookingController>(BookingController()).bookings;

  BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final commonColor = const Color.fromARGB(255, 161, 203, 233);

    return Scaffold(
      drawer: isMobile
          ? Drawer(child: SideBarView())
          : null, // Drawer only for mobile
      appBar: isMobile
          ? AppBar(
              title: const Text('BookingsView'),
              elevation: 0,
              backgroundColor: commonColor,
            )
          : null,
      body: ResponsiveLayout(
        mobile: _buildMobileView(context),
        tablet: _buildTabletView(context),
        desktop: _buildDesktopView(context),
      ),
    );
  }

  /// Desktop Layout
  Widget _buildDesktopView(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 250, child: SideBarView()), // Permanent sidebar
        Expanded(child: _buildMainContent(context)),
      ],
    );
  }

  /// Tablet Layout
  Widget _buildTabletView(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 160, child: SideBarView()), // Permanent sidebar
        Expanded(child: _buildMainContent(context)),
      ],
    );
  }

  /// Mobile Layout
  Widget _buildMobileView(BuildContext context) {
    return _buildMainContent(
        context); // No permanent sidebar, just main content
  }

  /// Common Main Content
  Widget _buildMainContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          if (!isMobile) TopBarView(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusCards(
                      isMobile: MediaQuery.of(context).size.width < 600),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: MediaQuery.of(context).size.width < 600
                            ? BookingsListView()
                            : BookingsTable(),
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

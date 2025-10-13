import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/analytics.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_activity_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_categorystatus_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_customergrowthchart_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_overview_cards_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_performance_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_body_revenuechart_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_sidebar_widget.dart';
import 'package:wdr/app/views/anaytics/widgets/analytics_topbar_widget.dart';
import 'package:wdr/app/views/booking/widgets/responsive_widget.dart';

class AnalyticsView extends StatelessWidget {
  final AnalyticsController controller = Get.find();

  AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final commonColor = const Color.fromARGB(255, 161, 203, 233);

    return Scaffold(
      backgroundColor: Colors.white,

      // Add Drawer for mobile screens
      drawer: isMobile ? Drawer(child: SidebarView()) : null,
      appBar: isMobile
          ? AppBar(
              title: const Text('Analytics Management'),
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
        SizedBox(width: 250, child: SidebarView()), // Permanent sidebar
        Expanded(child: _buildMainContent(context)),
      ],
    );
  }

  /// Tablet Layout
  Widget _buildTabletView(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 160, child: SidebarView()), // Permanent sidebar
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
    final isTablet = MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          if (!isMobile) TopBarView(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverviewCards(),
                  const SizedBox(height: 16),
                  if (isMobile)
                    Column(
                      children: [
                        RevenueChart(),
                        const SizedBox(height: 16),
                        CategoryStats(),
                      ],
                    )
                  else if (isTablet)
                    Column(
                      children: [
                        RevenueChart(),
                        const SizedBox(height: 16),
                        CategoryStats(),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: RevenueChart(),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CategoryStats(),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (isMobile)
                    Column(
                      children: [
                        CustomerGrowthChart(),
                        const SizedBox(height: 16),
                        RecentActivity(),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomerGrowthChart(),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: RecentActivity(),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  const PerformanceMetrics(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

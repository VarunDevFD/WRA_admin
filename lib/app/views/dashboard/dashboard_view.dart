import 'package:flutter/material.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_sidebar_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_top_session_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_topcategories_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_welcome_session_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_statscards_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_quickactions_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dashboard_recentactivity_widget.dart';
import 'package:wdr/app/widgets/dashboard_widgets/dasboard_revenuechart_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    // Define responsive padding and spacing
    final double padding = isMobile
        ? 16.0
        : isTablet
            ? 20.0
            : 24.0;
    final double spacing = isMobile
        ? 16.0
        : isTablet
            ? 20.0
            : 30.0;

    return Scaffold(
      // Add Drawer for mobile screens
      drawer: isMobile ? Drawer(child: Sidebar()) : null,
      appBar: isMobile
          ? AppBar(
              title: const Text('Dashboard'),
              elevation: 0,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return isMobile
              ? _buildMainContent(context, padding, spacing, isMobile, isTablet)
              : Row(
                  children: [
                    if (!isMobile)
                      const Sidebar(), // Sidebar for tablet/desktop
                    Expanded(
                      child: _buildMainContent(
                          context, padding, spacing, isMobile, isTablet),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    double padding,
    double spacing,
    bool isMobile,
    bool isTablet,
  ) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          if (!isMobile) TopBarWidget(), // Top bar for tablet/desktop
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: isMobile || isTablet
                  ? _buildVerticalLayout(spacing)
                  : _buildDesktopLayout(spacing),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalLayout(double spacing) {
    // Vertical layout for mobile and tablet
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeSectionWidget(),
        SizedBox(height: spacing),
        StatsCards(),
        SizedBox(height: spacing),
        RecentActivity(),
        SizedBox(height: spacing),
        RevenueChart(),
        SizedBox(height: spacing),
        QuickActions(),
        SizedBox(height: spacing),
        TopCategoriesView(),
      ],
    );
  }

  Widget _buildDesktopLayout(double spacing) {
    // Horizontal layout for desktop
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeSectionWidget(),
        SizedBox(height: spacing),
        StatsCards(),
        SizedBox(height: spacing),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  RecentActivity(),
                  SizedBox(height: spacing * 0.66),
                  const RevenueChart(),
                ],
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: Column(
                children: [
                  const QuickActions(),
                  SizedBox(height: spacing * 0.66),
                  TopCategoriesView(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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

class AnalyticsView extends StatelessWidget {
  final AnalyticsController controller = Get.find();

  AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarView(),
          Expanded(
            child: Column(
              children: [
                TopBarView(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewCards(),
                        SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: RevenueChart(),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CategoryStats(),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 24),
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
                        SizedBox(height: 24),
                        PerformanceMetrics(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

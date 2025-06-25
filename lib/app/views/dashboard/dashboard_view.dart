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
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: Column(
                children: [
                  TopBarWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WelcomeSectionWidget(),
                          SizedBox(height: 30),
                          StatsCards(),
                          SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    RecentActivity(),
                                    SizedBox(height: 20),
                                    RevenueChart(),
                                  ],
                                ),
                              ),
                              SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  children: [
                                    QuickActions(),
                                    SizedBox(height: 20),
                                    TopCategoriesView(),
                                  ],
                                ),
                              ),
                            ],
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

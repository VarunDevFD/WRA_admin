import 'package:flutter/material.dart';
import 'package:wdr/app/views/customers/widget/customer_sidebar_widet.dart';
import 'package:wdr/app/views/customers/widget/customer_table_widget.dart';
import 'package:wdr/app/views/customers/widget/customer_top_session_widget.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    // Responsive padding
    final padding = isMobile
        ? const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0)
        : isTablet
            ? const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
            : const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0);

    return Scaffold(
      drawer: isMobile ? const Drawer(child: SidebarView()) : null,
      appBar: isMobile
          ? AppBar(
              title: const Text('Customer Management'),
              elevation: 0,
            )
          : null,
      body: isMobile
          ? Column(
              // 📱 Mobile layout: stacked vertically
              children: [
                // const TopSessionView(),
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: CustomBodyTableView(),
                  ),
                ),
              ],
            )
          : Row(
              // Tablet/Desktop layout: sidebar + content
              children: [
                const SidebarView(),
                Expanded(
                  child: Container(
                    color: Colors.white60,
                    child: Column(
                      children: [
                        const TopSessionView(),
                        Expanded(
                          child: Padding(
                            padding: padding,
                            child: CustomBodyTableView(),
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

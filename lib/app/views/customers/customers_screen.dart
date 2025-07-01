import 'package:flutter/material.dart';
import 'package:wdr/app/views/customers/widget/customer_sidebar_widet.dart';
import 'package:wdr/app/views/customers/widget/customer_table_widget.dart';
import 'package:wdr/app/views/customers/widget/customer_top_session_widget.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
    return Scaffold(
      body: Row(
        children: [
          SidebarView(),
          Expanded(
            child: Container(
              color: Colors.white60,
              child: Column(
                children: [
                  TopSessionView(),
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

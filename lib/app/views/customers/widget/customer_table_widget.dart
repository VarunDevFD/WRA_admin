import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/customers/customers_controller.dart';
import 'package:wdr/app/views/customers/widget/customer_list_widget.dart';
import 'package:wdr/app/views/customers/widget/customer_sort_options_widget.dart';

class CustomBodyTableView extends StatelessWidget {
  final controller = Get.put(CustomersController());

  CustomBodyTableView({super.key});

  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

    return Column(
      children: [
        // Table Header with Sort Menu
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Row(
            children: [
              // Name column header
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: controller.toggleNameSort,
                  child: Row(
                    children: [
                      Text('Name', style: headerStyle),
                      const SizedBox(width: 8),
                      Obx(() => Icon(
                            controller.isAscending.value
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 18,
                            color: Colors.blue.shade600,
                          )),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              // Owner column header
              Expanded(
                flex: 2,
                child: Text(
                  'Owner',
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // Date column header
              Expanded(
                flex: 2,
                child: Text(
                  'Date',
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // Location column header
              Expanded(
                flex: 2,
                child: Text(
                  'Location',
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              // Sort button
              InkWell(
                onTap: controller.toggleSortMenu,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sort,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Sort',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Sort Menu
        Obx(() => controller.showSortMenu.value
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SortOptions(controller: controller),
              )
            : const SizedBox.shrink()),

        // Customer List
        Expanded(
          child: SizedBox(
            child: Obx(() => ListView.separated(
                  itemCount: controller.customers.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 3,
                    color: Colors.grey.shade200,
                  ),
                  itemBuilder: (context, index) {
                    final customer = controller.customers[index];
                    return TableListTileView(index, customer, controller);
                  },
                )),
          ),
        ),
      ],
    );
  }
}

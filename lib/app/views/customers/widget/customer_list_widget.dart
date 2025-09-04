import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/customers/customers_controller.dart';
import 'package:wdr/app/models/customer.dart';

class TableListTileView extends StatelessWidget {
  final int index;
  final Customer customer;
  final CustomersController controller;

  const TableListTileView(this.index, this.customer, this.controller,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 900 && screenSize.width < 1200;
    final miniTablet = screenSize.width >= 600 && screenSize.width < 900;
    final isHovered = false.obs;
    final fontSize = miniTablet
        ? 14.0
        : isTablet
            ? 16.0
            : isMobile
                ? 12.0
                : 18.0;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
            color: isHovered.value ? Colors.grey.shade100 : Colors.transparent,
            child: Row(
              children: [
                // Name section
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.folder,
                          size: fontSize,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          customer.name,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),

                // Email
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        customer.email,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),

                // Date
                Expanded(
                  flex: 1,
                  child: Text(
                    controller.formatDate(customer.joinDate),
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),

                // Address
                Expanded(
                  flex: 2,
                  child: Text(
                    customer.address,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Action icons (on hover)
                Obx(() => isHovered.value
                    ? Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  customer.isView
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: customer.isStarred
                                      ? Colors.grey.shade700
                                      : Colors.grey.shade400,
                                  size: isTablet ? 20 : 22,
                                ),
                                tooltip: customer.isStarred
                                    ? 'View details'
                                    : 'Hide View',
                                onPressed: () {
                                  // controller.viewCustomer(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  customer.isStarred
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: customer.isStarred
                                      ? Colors.yellow.shade700
                                      : Colors.grey,
                                  size: isTablet ? 20 : 22,
                                ),
                                tooltip: customer.isStarred
                                    ? 'Remove from favorites'
                                    : 'Add to favorites',
                                onPressed: () => controller.toggleStar(index),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: isTablet ? 20 : 22,
                                ),
                                tooltip: 'Delete',
                                onPressed: () =>
                                    controller.deleteCustomer(index),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Icon(Icons.more_vert,
                        size: isTablet ? 20 : 22,
                        color: Colors.grey,
                        key: ValueKey('default'))),
              ],
            ),
          )),
    );
  }
}

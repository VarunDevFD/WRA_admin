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
    final isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            color: isHovered.value ? Colors.grey.shade100 : Colors.transparent,
            child: Row(
              children: [
                // Name section
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.folder,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          customer.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Email
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
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
                      const SizedBox(width: 5),
                      Text(
                        customer.email,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Date
                Expanded(
                  flex: 2,
                  child: Text(
                    controller.formatDate(customer.joinDate),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

                // Address
                Expanded(
                  flex: 2,
                  child: Text(
                    customer.address,
                    style: TextStyle(
                      fontSize: 12,
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
                                  size: 16,
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
                                  size: 16,
                                ),
                                tooltip: customer.isStarred
                                    ? 'Remove from favorites'
                                    : 'Add to favorites',
                                onPressed: () => controller.toggleStar(index),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                tooltip: 'Delete',
                                onPressed: () =>
                                    controller.deleteCustomer(index),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Icon(Icons.more_vert,
                        size: 16,
                        color: Colors.grey,
                        key: ValueKey('default'))),
              ],
            ),
          )),
    );
  }
}

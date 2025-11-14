import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/views/products/widgets/product_body_session_verify_widget.dart';
import 'package:wdr/app/views/products/widgets/rental_bodysession_widget.dart';
import 'package:wdr/app/views/products/widgets/rental_dropfield_widget.dart';
import 'package:wdr/app/views/products/widgets/rental_sidebar_widget.dart';
import 'package:wdr/app/views/products/widgets/searchbar_widget.dart';
import '../../controllers/rental_controller.dart';

class ProductsView extends StatelessWidget {
  final ProductsController controller = Get.find();
  final RxString selectedCategory = 'All'.obs;

  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products Items',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SearchBarView(),
                      const SizedBox(width: 16),
                      Obx(() => IconButton(
                            icon: Icon(
                              controller.isGridView.value
                                  ? Icons.grid_view
                                  : Icons.list,
                              color: Colors.blueAccent,
                            ),
                            onPressed: controller.toggleViewMode,
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Filters Row
                  Row(
                    children: [
                      buildCategoryFilter(),
                      const SizedBox(width: 16),
                      SortDropdownButton(
                        onSelected: (selected) {
                          switch (selected) {
                            case 'name_asc':
                              controller.sortItemsByName(ascending: true);
                              break;
                            case 'name_desc':
                              controller.sortItemsByName(ascending: false);
                              break;
                            case 'date_desc':
                              controller.sortItemsByDate(ascending: false);
                              break;
                            case 'date_asc':
                              controller.sortItemsByDate(ascending: true);
                              break;
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Tab Switch Buttons
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => controller.switchTab('products'),
                        child: Obx(() => Text(
                              'All Products',
                              style: TextStyle(
                                fontWeight:
                                    controller.selectedTab.value == 'products'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color:
                                    controller.selectedTab.value == 'products'
                                        ? Colors.blue
                                        : Colors.grey[700],
                              ),
                            )),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.switchTab('approve'),
                        child: Obx(() => Text(
                              'Approve / Reject',
                              style: TextStyle(
                                fontWeight:
                                    controller.selectedTab.value == 'approve'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: controller.selectedTab.value == 'approve'
                                    ? Colors.blue
                                    : Colors.grey[700],
                              ),
                            )),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1),

                  // Dynamic Body
                  Expanded(
                    child: Obx(() {
                      if (controller.selectedTab.value == 'products') {
                        return BodySession(); // your product list widget
                      } else {
                        return ApproveRejectProductsView(); // new view
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryFilter() {
    return Obx(() {
      return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0x0D000000),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0x4D9E9E9E)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedCategory.value,
            icon:
                Icon(Icons.arrow_drop_down, size: 20, color: Colors.grey[700]),
            dropdownColor: Colors.white,
            style: TextStyle(fontSize: 13, color: Colors.grey[800]),
            items: categoryList.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(
                  category,
                  style: TextStyle(
                    fontWeight: selectedCategory.value == category
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                selectedCategory.value = newValue;
                controller.filterItemsByCategory(newValue);
              }
            },
          ),
        ),
      );
    });
  }

  final List<String> categoryList = [
    'All',
    'Camera',
    'Dresses',
    'Decoration',
    'Footwears',
    'Jewelry',
    'Sound Systems & DJ',
    'Vehicles',
    'Venues',
  ];
}

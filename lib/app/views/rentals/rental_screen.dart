import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/views/rentals/widgets/rental_bodysession_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_dropfield_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_grid_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_sidebar_widget.dart';
import 'package:wdr/app/views/rentals/widgets/searchbar_widget.dart';
import '../../controllers/rental_controller.dart';

class RentalView extends StatelessWidget {
  final RentalController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final RxString selectedCategory = 'All'.obs;

  RentalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rental Items',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SearchBarView(),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          GridToggleSwitcher(isGridView: controller.isGridView)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildCategoryFilter(),
                      SizedBox(width: 16),
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
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  Expanded(
                    child: BodySession(),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0x0D000000), // Black with 5% opacity
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0x4D9E9E9E)), // Grey with 30% opacity
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedCategory.value,
            icon:
                Icon(Icons.arrow_drop_down, size: 20, color: Colors.grey[700]),
            dropdownColor: Colors.white,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800],
            ),
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

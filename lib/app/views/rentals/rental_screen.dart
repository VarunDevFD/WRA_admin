import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/views/rentals/widgets/rental_bodysession_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_dropfield_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_grid_widget.dart';
import 'package:wdr/app/views/rentals/widgets/rental_sidebar_widget.dart';
import 'package:wdr/app/views/rentals/widgets/searchbar_widget.dart';
import '../../controllers/rental_controller.dart';

class RentalView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final RxString selectedCategory = 'All'.obs;

  RentalView({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalController controller = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final commonColor = const Color.fromARGB(255, 161, 203, 233);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: isMobile ? Drawer(child: const Sidebar()) : null,
      appBar: isMobile
          ? AppBar(
              title: const Text('Rental Items'),
              elevation: 0,
              backgroundColor: commonColor,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              if (!isMobile) const Sidebar(), // Sidebar for tablet and desktop
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rental Items',
                              style: TextStyle(
                                fontSize: isTablet ? 22 : 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(child: SearchBarView()),
                            const SizedBox(width: 16),
                            Row(
                              children: [GridToggleSwitcher()],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                      // For mobile, simplified layout
                      if (isMobile) ...[
                        Text(
                          'Rental Items',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SearchBarView(),
                        const SizedBox(height: 12),
                        GridToggleSwitcher(),
                        const SizedBox(height: 16),
                      ],
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          buildCategoryFilter(),
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
                      Divider(color: Colors.grey[300], thickness: 1),
                      const SizedBox(height: 10),
                      Expanded(child: BodySession()),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCategoryFilter() {
    final RentalController controller = Get.find();
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

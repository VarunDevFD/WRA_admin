import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

class BodySession extends StatelessWidget {
  final ProductsController controller = Get.find();
  BodySession({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Obx(() {
      final items = controller.filteredItems;
      final isGrid = controller.isGridView.value;
      var screenSize = controller.screenSize.value;
      if (isMobile) {
        screenSize = true; // Force single column on mobile
      } else {
        screenSize = false; // Use grid on larger screens
      }

      if (items.isEmpty) {
        return Center(
          child: Text(
            'No items available in this category.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          int crossAxisCount;
          if (screenWidth >= 1200) {
            crossAxisCount = 4;
          } else if (screenWidth >= 800) {
            crossAxisCount = 3;
          } else if (screenWidth >= 600) {
            crossAxisCount = 2;
          } else {
            crossAxisCount = 1;
          }

          return isGrid
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4 / 3,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildItemCard(
                      item: items[index],
                      isGrid: true,
                      commonColor: Colors.blueAccent,
                      controller: controller,
                      screenSize: screenSize),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: isMobile ? 12 : 8),
                    child: buildItemCard(
                        item: items[index],
                        isGrid: false,
                        commonColor: Colors.blueAccent,
                        controller: controller,
                        screenSize: screenSize),
                  ),
                );
        },
      );
    });
  }

  Widget buildItemCard({
    required dynamic item,
    required bool isGrid,
    required Color commonColor,
    required ProductsController controller,
    bool screenSize = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      height: isGrid ? 350 : 150,
      decoration: BoxDecoration(
        color: commonColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: isGrid
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                            image: item.imageUrl.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(item.imageUrl),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: item.imageUrl.isEmpty
                              ? Center(
                                  child: Icon(Icons.image_not_supported,
                                      color: Colors.grey[400]),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ...itemCardContent(item, screenSize),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Approved',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.visibility, color: Colors.grey[700]),
                        onPressed: () {
                          // Implement navigation or detail logic
                          controller.openItemDetails(item);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  height: 120,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    image: item.imageUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: item.imageUrl.isEmpty
                      ? Icon(Icons.image_not_supported,
                          size: 40, color: Colors.grey[400])
                      : null,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: itemCardContent(item),
                  ),
                ),
                Text(
                  'Approved',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.visibility, color: Colors.grey[700]),
                  onPressed: () {
                    controller.openItemDetails(item);
                  },
                ),
              ],
            ),
    );
  }

  List<Widget> itemCardContent(dynamic item, [bool isMobile = false]) {
    return [
      Text(
        item.name,
        style: TextStyle(
            fontSize: isMobile ? 14 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height: 4),
      Text(
        item.description,
        style: TextStyle(fontSize: isMobile ? 10 : 16, color: Colors.grey[600]),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height: 8),
      Text(
        '₹${item.price}',
        style: TextStyle(
            fontSize: isMobile ? 12 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.indigo),
      ),
    ];
  }
}

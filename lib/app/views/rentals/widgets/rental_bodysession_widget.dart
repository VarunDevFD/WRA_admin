import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

class BodySession extends StatelessWidget {
  final RentalController controller = Get.find();
  BodySession({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = controller.filteredItems;

      if (items.isEmpty) {
        return Center(
          child: Text(
            'No items available in this category.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        );
      }

      return controller.isGridView.value
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 50,
                crossAxisSpacing: 20,
                childAspectRatio: 4 / 3,
              ),
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  buildItemCard(items[index], isGrid: true),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: buildItemCard(items[index], isGrid: false),
              ),
            );
    });
  }

  Widget buildItemCard(dynamic item, {required bool isGrid}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
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
                              ? Icon(Icons.image_not_supported,
                                  size: 40, color: Colors.grey[400])
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ...itemCardContent(item),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.visibility, color: Colors.grey[700]),
                    onPressed: () {
                      // Implement navigation or detail logic
                      controller.openItemDetails(item);
                    },
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  height: 80,
                  width: 100,
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
                IconButton(
                  icon: Icon(Icons.visibility, color: Colors.grey[700]),
                  onPressed: () {
                    // Implement navigation or detail logic
                    controller.openItemDetails(item);
                  },
                ),
              ],
            ),
    );
  }

  List<Widget> itemCardContent(dynamic item) {
    return [
      Text(
        item.name,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height: 4),
      Text(
        item.description,
        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height: 8),
      Text(
        '₹${item.price}',
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.indigo),
      ),
    ];
  }

  
}

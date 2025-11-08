import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

class ApproveRejectProductsView extends StatelessWidget {
  final ProductsController controller = Get.find();

  ApproveRejectProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pending = controller.pendingItems;

      if (pending.isEmpty) {
        return const Center(child: Text("No pending items found."));
      }

      return controller.isGridView.value
          ? GridView.builder(
              itemCount: pending.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = pending[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                              color: const Color.fromARGB(255, 225, 206, 206)),
                        ),
                        //  item.imageUrl.isNotEmpty
                        //     ? Image.network(item.imageUrl, fit: BoxFit.cover)
                        //     : Container(color: Colors.grey[300]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () {
                              controller.approvedItems.add(item);
                              controller.pendingItems.remove(item);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              controller.pendingItems.remove(item);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: pending.length,
              itemBuilder: (context, index) {
                final item = pending[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                    ),
                    //  item.imageUrl.isNotEmpty
                    //     ? Image.network(item.imageUrl, width: 50, height: 50)
                    //     : Container(
                    //         width: 50,
                    //         height: 50,
                    //         color: Colors.grey[300],
                    //       ),
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () {
                            controller.approvedItems.add(item);
                            controller.pendingItems.remove(item);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            controller.pendingItems.remove(item);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}

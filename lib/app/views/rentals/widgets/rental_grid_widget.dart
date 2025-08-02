import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

class GridToggleSwitcher extends StatelessWidget {
  const GridToggleSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalController controller = Get.find();

    final commonColor = const Color.fromARGB(255, 161, 203, 233);

    return Obx(() {
      return Container(
        height: 36,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x4D9E9E9E)),
        ),
        child: Row(
          children: [
            // Grid Tab
            GestureDetector(
              onTap: () => controller.isGridView.value = true,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: controller.isGridView.value ? commonColor : Colors.transparent,
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    if (controller.isGridView.value)
                      const Icon(Icons.check_sharp, size: 16),
                    const SizedBox(width: 6),
                    const Icon(Icons.grid_view, size: 16),
                  ],
                ),
              ),
            ),

            // List Tab
            GestureDetector(
              onTap: () => controller.isGridView.value = false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: !controller.isGridView.value ? commonColor : Colors.transparent,
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    if (!controller.isGridView.value)
                      const Icon(Icons.check_sharp, size: 16),
                    const SizedBox(width: 6),
                    const Icon(Icons.view_list, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridToggleSwitcher extends StatelessWidget {
  final RxBool isGridView;

  const GridToggleSwitcher({
    super.key,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0x0D000000),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x4D9E9E9E)),
        ),
        child: Row(
          children: [
            // Grid Tab
            GestureDetector(
              onTap: () => isGridView.value = true,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isGridView.value
                      ? const Color(0xFF3F51B5)
                      : Colors.transparent,
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    if (isGridView.value)
                      const Icon(Icons.check_sharp, size: 16),
                    const SizedBox(width: 6),
                    const Icon(Icons.grid_view, size: 16),
                  ],
                ),
              ),
            ),

            // List Tab
            GestureDetector(
              onTap: () => isGridView.value = false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: !isGridView.value
                      ? const Color(0xFF3F51B5)
                      : Colors.transparent,
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Icon(Icons.view_list, size: 16),
                    const SizedBox(width: 6),
                    if (!isGridView.value)
                      const Icon(Icons.check_sharp, size: 16),
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

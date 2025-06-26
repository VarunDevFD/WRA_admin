import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/rental_controller.dart';

class SearchBarView extends StatelessWidget {
  final RentalController controller = Get.find();
  final RxString selectedCategory = 'All'.obs;

    SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 500,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0x0D000000),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0x4D9E9E9E)),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) {
            controller.searchQuery.value = value.toLowerCase();
            controller.searchAndFilterItems(selectedCategory.value, value);
          },
          decoration: InputDecoration(
            icon: Icon(Icons.search, size: 18),
            hintText: 'Search items...',
            border: InputBorder.none,
            isDense: true,
          ),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
} 
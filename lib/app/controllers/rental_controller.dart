import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/models/rental.dart';

class RentalController extends GetxController {
  final RxList<Rental> allItems = <Rental>[].obs;
  final RxList<Rental> filteredItems = <Rental>[].obs;
  final RxBool isGridView = true.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData();
    filterItemsByCategory('All');
  }

  void sortItemsByName({required bool ascending}) {
    final sorted = List<Rental>.from(filteredItems);
    sorted.sort((a, b) =>
        ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
    filteredItems.value = List<Rental>.from(sorted);
  }

  void sortItemsByDate({required bool ascending}) {
    final sorted = List<Rental>.from(filteredItems);
    sorted.sort((a, b) =>
        ascending ? a.date.compareTo(b.date) : b.date.compareTo(a.date));
    filteredItems.value = List<Rental>.from(sorted);
  }

  void loadMockData() {
    allItems.assignAll([
      Rental(
        name: 'Canon EOS 5D',
        description: 'Professional DSLR Camera with 24-105mm lens',
        price: 2500,
        imageUrl:
            'https://images.unsplash.com/photo-1519183071298-a2962d048a1c', // sample image
        category: 'Camera',
        date: DateTime(2023, 5, 10),
      ),
      Rental(
        name: 'Bridal Lehenga',
        description: 'Red embroidered designer lehenga for wedding',
        price: 4000,
        imageUrl:
            'https://images.unsplash.com/photo-1582735681846-848ce3f9f5c8', // sample image
        category: 'Dresses',
        date: DateTime(2023, 6, 15),
      ),
      Rental(
        name: 'Stage Decoration',
        description: 'Floral and LED lighting setup',
        price: 3500,
        imageUrl: '',
        category: 'Decoration',
        date: DateTime(2023, 7, 20),
      ),
    ]);

    // show all by default
    filteredItems.assignAll(allItems);
  }

  void filterItemsByCategory(String category) {
    if (category == 'All') {
      filteredItems.value = allItems;
    } else {
      filteredItems.value = allItems
          .where(
              (item) => item.category.toLowerCase() == category.toLowerCase())
          .toList();
    }
  }

  void searchAndFilterItems(String category, String query) {
    final filtered = allItems.where((item) {
      final matchesCategory = category == 'All' || item.category == category;
      final matchesSearch =
          item.name.toLowerCase().contains(query.toLowerCase()) ||
              item.description.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    filteredItems.assignAll(filtered);
  }

  void openItemDetails(dynamic item) {
    Get.defaultDialog(
      title: item.name,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description: ${item.description}'),
          Text('Price: ₹${item.price}'),
          // Add more fields if needed
        ],
      ),
    );
  }
}

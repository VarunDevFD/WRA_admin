import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/models/rental.dart';

class ProductsController extends GetxController {
  final RxList<Product> allItems = <Product>[].obs;
  final RxList<Product> filteredItems = <Product>[].obs;
  final RxList<Product> pendingItems = <Product>[].obs;
  final RxList<Product> approvedItems = <Product>[].obs;

  final RxBool isGridView = true.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedTab = 'products'.obs; // 'products' or 'approve'

  void switchTab(String tab) {
    selectedTab.value = tab;
  }

  @override
  void onInit() {
    super.onInit();
    loadMockData();
    filterItemsByCategory('All');
  }

  void loadMockData() {
    final mock = [
      Product(
        name: 'Canon EOS 5D',
        description: 'Professional DSLR Camera with 24-105mm lens',
        price: 2500,
        imageUrl:
            'https://images.unsplash.com/photo-1519183071298-a2962d048a1c',
        category: 'Camera',
        date: DateTime(2023, 5, 10),
        status: 'approved',
      ),
      Product(
        name: 'Bridal Lehenga',
        description: 'Red embroidered designer lehenga for wedding',
        price: 4000,
        imageUrl:
            'https://images.unsplash.com/photo-1582735681846-848ce3f9f5c8',
        category: 'Dresses',
        date: DateTime(2023, 6, 15),
        status: 'pending',
      ),
      Product(
        name: 'Stage Decoration',
        description: 'Floral and LED lighting setup',
        price: 3500,
        imageUrl:
            'https://images.unsplash.com/photo-1582735681846-848ce3f9f5c8',
        category: 'Decoration',
        date: DateTime(2023, 7, 20),
        status: 'pending',
      ),
    ];

    allItems.assignAll(mock);
    approvedItems.assignAll(mock.where((i) => i.status == 'approved').toList());
    pendingItems.assignAll(mock.where((i) => i.status == 'pending').toList());
    filteredItems.assignAll(allItems);
  }

  void sortItemsByName({required bool ascending}) {
    final sorted = List<Product>.from(filteredItems);
    sorted.sort((a, b) =>
        ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
    filteredItems.value = sorted;
  }

  void sortItemsByDate({required bool ascending}) {
    final sorted = List<Product>.from(filteredItems);
    sorted.sort((a, b) =>
        ascending ? a.date.compareTo(b.date) : b.date.compareTo(a.date));
    filteredItems.value = sorted;
  }

  void filterItemsByCategory(String category) {
    if (category == 'All') {
      filteredItems.assignAll(allItems);
    } else {
      filteredItems.assignAll(
        allItems
            .where(
                (item) => item.category.toLowerCase() == category.toLowerCase())
            .toList(),
      );
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

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }

  void openItemDetails(Product item) {
    Get.defaultDialog(
      title: item.name,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description: ${item.description}'),
          Text('Price: ₹${item.price}'),
          Text('Status: ${item.status}'),
        ],
      ),
    );
  }
}

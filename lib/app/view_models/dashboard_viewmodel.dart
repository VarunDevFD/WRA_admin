import 'package:wdr/app/models/top_category_item.dart';

import 'package:flutter/material.dart';

class TopCategoriesViewModel {
  List<CategoryItem> getCategories() {
    return [
      CategoryItem(name: 'Wedding Camera', count: 34, color: Colors.blue),
      CategoryItem(name: 'Wedding Dresses', count: 28, color: Colors.pink),
      CategoryItem(name: 'Decoration', count: 25, color: Colors.yellowAccent),
      CategoryItem(name: 'Footwears', count: 20, color: Colors.indigo),
      CategoryItem(name: 'Jewelry', count: 18, color: Colors.purple),
      CategoryItem(name: 'Sound Systems and DJ', count: 14, color: Colors.green),
      CategoryItem(name: 'Vehicles', count: 9, color: Colors.orange),
      CategoryItem(name: 'Venues', count: 6, color: Colors.teal),
    ];
  }
}

 
import 'package:wdr/app/models/top_category_item.dart';
import 'package:wdr/app/view_models/dashboard_viewmodel.dart';

class TopCategoriesController {
  final TopCategoriesViewModel _viewModel = TopCategoriesViewModel();

  List<CategoryItem> fetchCategories() {
    // You can add filtering or sorting logic here
    return _viewModel.getCategories();
  }
}

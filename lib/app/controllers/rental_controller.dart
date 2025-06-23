import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wdr/app/models/rental.dart';

class RentalController extends GetxController {
  final RxList<Rental> rentals = <Rental>[].obs; // All rentals
  final RxList<Rental> filteredRentals = <Rental>[].obs; // Filtered rentals

  @override
  void onInit() {
    super.onInit();
    // Initialize rentals (e.g., fetch from API or database)
    fetchRentals();
  }

  void fetchRentals() {
    // Example: Populate rentals (replace with actual data source)
    rentals.addAll([
      Rental(id: '1', name: 'Canon EOS', category: 'Camera', price: 50.0, imageUrl: '...', description: '...'),
      Rental(id: '2', name: 'Zoom Lens', category: 'Lens', price: 30.0, imageUrl: '...', description: '...'),
    ]);
    filteredRentals.assignAll(rentals); // Initially show all rentals
  }

  void filterByCategory(String category) {
    if (category == 'All') {
      filteredRentals.assignAll(rentals);
    } else {
      filteredRentals.assignAll(rentals.where((rental) => rental.category == category));
    }
  }

  void deleteRental(String id) {
    rentals.removeWhere((rental) => rental.id == id);
    filteredRentals.removeWhere((rental) => rental.id == id);
  }
}
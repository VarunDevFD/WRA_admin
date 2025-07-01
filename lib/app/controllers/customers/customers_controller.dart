import 'package:get/get.dart';
import 'package:wdr/app/models/customer.dart';

class CustomersController extends GetxController {
  final RxList<Customer> customers = <Customer>[
    Customer(
      id: '1',
      type: 'user',
      name: 'John Doe',
      email: 'john@example.com',
      phone: '+1234567890',
      address: '123 Main St, City',
      joinDate: DateTime.now().subtract(Duration(days: 30)),
    ),
    Customer(
      id: '2',
      type: 'provider',
      name: 'Jane Smith',
      email: 'jane@example.com',
      phone: '+0987654321',
      address: '456 Oak Ave, Town',
      joinDate: DateTime.now().subtract(Duration(days: 15)),
    ),
    Customer(
      id: '3',
      type: 'user',
      name: 'Alice Johnson',
      email: 'alice@example.com',
      phone: '+1122334455',
      address: '789 Pine Rd, Village',
      joinDate: DateTime.now().subtract(Duration(days: 45)),
    ),
    Customer(
      id: '4',
      type: 'provider',
      name: 'Bob Wilson',
      email: 'bob@example.com',
      phone: '+5566778899',
      address: '321 Elm St, Metro',
      joinDate: DateTime.now().subtract(Duration(days: 7)),
    ),
  ].obs;

  // Reactive sorting/filtering settings
  var sortBy = SortBy.name.obs;
  var sortDirection = SortDirection.aToZ.obs;
  var sortPersons = SortPersons.all.obs;
  var showSortMenu = false.obs;
  var isAscending = true.obs;

  /// Deletes a customer at the given index
  void deleteCustomer(int index) {
    customers.removeAt(index);
  }

  /// Toggles the star/favorite status of a customer
  void toggleStar(int index) {
    final c = customers[index];
    customers[index] = Customer(
      id: c.id,
      type: c.type,
      name: c.name,
      email: c.email,
      phone: c.phone,
      address: c.address,
      joinDate: c.joinDate,
      isStarred: !c.isStarred,
    );
    customers.refresh(); // Ensures UI updates
  }

  /// Sets the sorting criteria (by name, date, etc.)
  void setSortBy(SortBy newSortBy) {
    sortBy.value = newSortBy;
    sortCustomers();
    showSortMenu.value = false;
  }

  /// Sets sorting direction (A-Z or Z-A)
  void setSortDirection(SortDirection newDirection) {
    sortDirection.value = newDirection;
    isAscending.value = newDirection == SortDirection.aToZ;
    sortCustomers();
  }

  /// Sets filter type (all, user, provider)
  void setSortPersons(SortPersons newSortPersons) {
    sortPersons.value = newSortPersons;
    sortCustomers();
  }

  /// Toggles sort menu visibility
  void toggleSortMenu() {
    showSortMenu.value = !showSortMenu.value;
  }

  /// Toggles name sorting direction
  void toggleNameSort() {
    isAscending.value = !isAscending.value;
    sortDirection.value =
        isAscending.value ? SortDirection.aToZ : SortDirection.zToA;
    sortCustomers();
  }

  /// Applies both filtering and sorting on customers list
  void sortCustomers() {
    // Start with full list
    var filtered = <Customer>[
      ...[
        Customer(
          id: '1',
          type: 'user',
          name: 'John Doe',
          email: 'john@example.com',
          phone: '+1234567890',
          address: '123 Main St, City',
          joinDate: DateTime.now().subtract(Duration(days: 30)),
        ),
        Customer(
          id: '2',
          type: 'provider',
          name: 'Jane Smith',
          email: 'jane@example.com',
          phone: '+0987654321',
          address: '456 Oak Ave, Town',
          joinDate: DateTime.now().subtract(Duration(days: 15)),
        ),
        Customer(
          id: '3',
          type: 'user',
          name: 'Alice Johnson',
          email: 'alice@example.com',
          phone: '+1122334455',
          address: '789 Pine Rd, Village',
          joinDate: DateTime.now().subtract(Duration(days: 45)),
        ),
        Customer(
          id: '4',
          type: 'provider',
          name: 'Bob Wilson',
          email: 'bob@example.com',
          phone: '+5566778899',
          address: '321 Elm St, Metro',
          joinDate: DateTime.now().subtract(Duration(days: 7)),
        ),
      ]
    ];

    // Filter by person type
    if (sortPersons.value == SortPersons.user) {
      filtered = filtered.where((c) => c.type == 'user').toList();
    } else if (sortPersons.value == SortPersons.provider) {
      filtered = filtered.where((c) => c.type == 'provider').toList();
    }

    // Sort by selected field
    switch (sortBy.value) {
      case SortBy.name:
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortBy.dateShared:
      case SortBy.dateModified:
      case SortBy.dateModifiedByMe:
      case SortBy.dateOpenedByMe:
        filtered.sort((a, b) => a.joinDate.compareTo(b.joinDate));
        break;
    }

    // Apply sorting direction
    if (!isAscending.value || sortDirection.value == SortDirection.zToA) {
      filtered = filtered.reversed.toList();
    }

    customers.value = filtered;
  }

  /// Formats the date as YYYY-MM-DD
  String formatDate(DateTime date) {
    return date.toIso8601String().split('T').first;
  }
}

/// Enum for sorting fields
enum SortBy {
  name,
  dateShared,
  dateModified,
  dateModifiedByMe,
  dateOpenedByMe,
}

/// Enum for sorting direction
enum SortDirection {
  aToZ,
  zToA,
}

/// Enum for person type filtering
enum SortPersons {
  all,
  user,
  provider,
}

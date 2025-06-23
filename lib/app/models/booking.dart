class Booking {
  final String id;
  final String customerId;
  final String customerName;
  final List<String> itemIds;
  final DateTime startDate;
  final DateTime endDate;
  final double totalAmount;
  final String status;

  Booking({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.itemIds,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
    required this.status,
  });
}
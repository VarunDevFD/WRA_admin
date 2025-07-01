class Customer {
  final String id;
  final String type;
  final String name;
  final String email;
  final String phone;
  final String address;
  final DateTime joinDate;
  final bool isStarred;
  final bool isView;

  Customer({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.joinDate,
    this.isStarred = false,
    this.isView = false,
  });
}

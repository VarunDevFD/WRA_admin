import 'package:get/get.dart';

class ProviderRequest {
  final String id;
  final String providerName;
  final String category;
  final DateTime submittedDate;
  final RxString status; // 'pending', 'approved', 'rejected'
  final List<String> documents; // list of image URLs
  final String phone;
  final String email;

  ProviderRequest({
    required this.id,
    required this.providerName,
    required this.category,
    required this.submittedDate,
    required String status,
    required this.documents,
    required this.phone,
    required this.email,
  }) : status = status.obs;
}

import 'package:get/get.dart';
import 'package:wdr/app/models/provider_request.dart';

class ProviderController extends GetxController {
  var providerRequests = <ProviderRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleData();
  }

  void _loadSampleData() {
    providerRequests.addAll([
      ProviderRequest(
        id: '1',
        providerName: 'John Doe',
        category: 'Plumbing',
        submittedDate: DateTime.now().subtract(Duration(days: 2)),
        status: 'pending',
        documents: [
          'https://example.com/doc1.jpg',
          'https://example.com/doc2.jpg'
        ],
        phone: '+1234567890',
        email: 'john@example.com',
      ),
      ProviderRequest(
        id: '2',
        providerName: 'Jane Smith',
        category: 'Electrical',
        submittedDate: DateTime.now().subtract(Duration(days: 5)),
        status: 'pending',
        documents: ['https://example.com/doc3.jpg'],
        phone: '+0987654321',
        email: 'jane@example.com',
      ),
    ]);
  }

  void approveRequest(String id) {
    var request = providerRequests.firstWhere((r) => r.id == id);
    request.status.value = 'approved';
    providerRequests.refresh();
  }

  void rejectRequest(String id) {
    var request = providerRequests.firstWhere((r) => r.id == id);
    request.status.value = 'rejected';
    providerRequests.refresh();
  }
}

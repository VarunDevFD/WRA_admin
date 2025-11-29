import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/provider_controller.dart';
import 'package:wdr/app/views/provider/widgets/provider_activity_widget.dart';
import 'package:wdr/app/views/provider/widgets/sidebar_widget.dart';

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  final ProviderController controller = Get.put(ProviderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Service Provider Requests'),
      // ),
      body: Obx(() {
        if (controller.providerRequests.isEmpty) {
          return const Center(child: Text('No requests available'));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sidebar(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Provider Name')),
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Submitted Date')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('View Documents')),
                    DataColumn(label: Text('Approve / Reject')),
                  ],
                  rows: controller.providerRequests.map((request) {
                    return DataRow(cells: [
                      DataCell(Text(request.providerName)),
                      DataCell(Text(request.category)),
                      DataCell(
                          Text(request.submittedDate.toString().split(' ')[0])),
                      DataCell(Obx(() => Text(request.status.value))),
                      DataCell(ElevatedButton(
                        onPressed: () =>
                            _viewDocuments(context, request.documents),
                        child: const Text('View'),
                      )),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                controller.approveRequest(request.id),
                            child: const Text('Approve'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () =>
                                controller.rejectRequest(request.id),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('Reject'),
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
            ProviderActivityWidget(),
            
          ],
        );
      }),
    );
  }

  void _viewDocuments(BuildContext context, List<String> documents) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Documents'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(documents[index],
                      height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

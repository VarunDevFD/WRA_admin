import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:wdr/app/controllers/provider_controller.dart';
import 'package:wdr/app/views/provider/widgets/line_chart_widget.dart';

class ProviderActivityWidget extends StatelessWidget {
  final ProviderController controller = Get.put(ProviderController());

  ProviderActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue[50],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Activity',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            LineChartSample2(),
            SizedBox(height: 10),
            Text(
              'Rejected List',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Provider Name')),
                DataColumn(label: Text('Category')),
                DataColumn(label: Text('Status')),
              ],
              rows: controller.providerRequests.map((request) {
                return DataRow(cells: [
                  DataCell(Text(request.providerName)),
                  DataCell(Text(request.category)),
                  DataCell(Text(
                    'rejected',
                    style: TextStyle(color: Colors.red),
                  )),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

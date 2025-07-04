import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsContent extends StatelessWidget {
  const PaymentMethodsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _buildBackButton(),
        Text('Payment Methods',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Card(
          child: ListTile(
          leading: Icon(Icons.credit_card),
          title: Text('**** **** **** 1234'),
          subtitle: Text('Expires 12/25'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Add Payment Method'),
        ),
        ],
      ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            color: Colors.blue[50],
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}

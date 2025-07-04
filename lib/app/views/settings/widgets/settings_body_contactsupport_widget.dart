import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSupportContent extends StatelessWidget {
  const ContactSupportContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _buildBackButton(),
        Text('Contact Support',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
          labelText: 'Subject',
          border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
          labelText: 'Message',
          border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
          Get.snackbar('Success', 'Message sent successfully');
          },
          child: Text('Send Message'),
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

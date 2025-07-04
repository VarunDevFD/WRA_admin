import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsContent extends StatelessWidget {
  const NotificationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _buildBackButton(),
        Text('Notifications',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        SwitchListTile(
          title: Text('Push Notifications'),
          subtitle: Text('Receive push notifications'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text('Email Notifications'),
          subtitle: Text('Receive email notifications'),
          value: false,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text('SMS Notifications'),
          subtitle: Text('Receive SMS notifications'),
          value: true,
          onChanged: (value) {},
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

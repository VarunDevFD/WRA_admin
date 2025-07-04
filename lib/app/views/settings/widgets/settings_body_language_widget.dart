import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageContent extends StatelessWidget {
  const LanguageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(),
            Text('Language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListTile(
              title: Text('English'),
              trailing:
                  Radio(value: true, groupValue: true, onChanged: (value) {}),
              onTap: () {},
            ),
            ListTile(
              title: Text('Spanish'),
              trailing:
                  Radio(value: false, groupValue: true, onChanged: (value) {}),
              onTap: () {},
            ),
            ListTile(
              title: Text('French'),
              trailing:
                  Radio(value: false, groupValue: true, onChanged: (value) {}),
              onTap: () {},
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

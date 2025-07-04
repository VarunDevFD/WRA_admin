import 'package:flutter/material.dart';

class TopSessionView extends StatelessWidget {
  const TopSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.lightBlue.shade50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Customer Management',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

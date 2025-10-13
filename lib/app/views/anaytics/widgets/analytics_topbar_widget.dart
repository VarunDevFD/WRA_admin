import 'package:flutter/material.dart';

class TopBarView extends StatelessWidget {
  const TopBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.lightBlue.shade50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Analytics Management',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

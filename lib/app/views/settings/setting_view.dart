import 'package:flutter/material.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_settingscontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_sidebar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final commonColor = const Color.fromARGB(255, 161, 203, 233);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile
          ? AppBar(
              title: const Text('Settings'),
              backgroundColor: commonColor,
              foregroundColor: Colors.black,
            )
          : null,
      drawer: isMobile ? const Drawer(child: SidebarView()) : null,
      body: Row(
        children: [
          (!isMobile) ? SidebarView() : SizedBox(),
          Expanded(
            child: SettingsContent(),
          ),
        ],
      ),
    );
  }
}

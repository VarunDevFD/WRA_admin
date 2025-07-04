import 'package:flutter/material.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_settingscontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_sidebar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarView(),
          Expanded(
            child: SettingsContent(),
          ),
        ],
      ),
    );
  }
}

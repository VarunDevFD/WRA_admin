import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_aboutcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_businessprofile_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_contactsupport_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_helpcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_language_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_notification_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_passwordcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_paymentmethod_widget.dart'; 
import 'package:wdr/app/views/settings/widgets/settings_body_profilecontent_widget.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Profile Section
        _buildSectionHeader('Profile'),
        _buildListTile(
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () {
            // if (!Get.isRegistered<SettingsController>()) {
            //   Get.put(SettingsController());
            // }
            Get.to(() => ProfileContent());
          },
        ),
        _buildListTile(
          icon: Icons.lock,
          title: 'Change Password',
          subtitle: 'Update your account password',
          onTap: () => Get.to(() => ChangePasswordContent()),
        ),

        const Divider(height: 32),

        // App Settings Section
        _buildSectionHeader('App Settings'),
        _buildListTile(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage your notification preferences',
          onTap: () => Get.to(() => NotificationsContent()),
        ),
        _buildListTile(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          subtitle: 'Toggle dark/light theme',
          trailing: Switch(
            value: Get.isDarkMode,
            onChanged: (value) {
              Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
        ),
        _buildListTile(
          icon: Icons.language,
          title: 'Language',
          subtitle: 'Choose your preferred language',
          onTap: () => Get.to(() => LanguageContent()),
        ),

        const Divider(height: 32),

        // Business Settings Section
        _buildSectionHeader('Business Settings'),
        _buildListTile(
          icon: Icons.business,
          title: 'Business Profile',
          subtitle: 'Manage your rental business details',
          onTap: () => Get.to(() => BusinessProfileContent()),
        ),
        _buildListTile(
          icon: Icons.payment,
          title: 'Payment Methods',
          subtitle: 'Manage payment options',
          onTap: () => Get.to(() => PaymentMethodsContent()),
        ),

        const Divider(height: 32),

        // Support Section
        _buildSectionHeader('Support'),
        _buildListTile(
          icon: Icons.help,
          title: 'Help & FAQ',
          subtitle: 'Get help and find answers',
          onTap: () => Get.to(() => HelpContent()),
        ),
        _buildListTile(
          icon: Icons.contact_support,
          title: 'Contact Support',
          subtitle: 'Reach out to our support team',
          onTap: () => Get.to(() => ContactSupportContent()),
        ),
        _buildListTile(
          icon: Icons.info,
          title: 'About',
          subtitle: 'App version and information',
          onTap: () => Get.to(() => AboutContent()),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/auth_controller.dart';
import 'package:wdr/app/controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Obx(() => _buildMainContent()),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2c3e50),
            Color(0xFF3498db),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.settings, color: Colors.white, size: 32),
                ),
                SizedBox(height: 12),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Management',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                _sidebarItem(Icons.dashboard, 'Dashboard', '/dashboard'),
                _sidebarItem(Icons.inventory, 'Rentals', '/rentals'),
                _sidebarItem(Icons.people, 'Customers', '/customers'),
                _sidebarItem(Icons.book_online, 'Bookings', '/bookings'),
                _sidebarItem(Icons.analytics, 'Analytics', '/analytics'),
                _sidebarItem(Icons.settings, 'Settings', '/settings',
                    isActive: true),
                SizedBox(height: 20),
                Divider(color: Colors.white24),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Get.find<AuthController>().logout(),
                    icon: Icon(Icons.logout, size: 18),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      minimumSize: Size(0, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, String route,
      {bool isActive = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.toNamed(route),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.white.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isActive
                  ? Border.all(color: Colors.white.withOpacity(0.3))
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : Colors.white70,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white70,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildSettingsContent() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Back button to return to main settings
        if (controller.selectedMenuItem.value != 'settings')
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => controller.selectMenuItem('settings'),
                ),
                Text('Back to Settings', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

        // Profile Section
        _buildSectionHeader('Profile'),
        _buildListTile(
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () => controller.selectMenuItem('edit_profile'),
        ),
        _buildListTile(
          icon: Icons.lock,
          title: 'Change Password',
          subtitle: 'Update your account password',
          onTap: () => controller.selectMenuItem('change_password'),
        ),

        const Divider(height: 32),

        // App Settings Section
        _buildSectionHeader('App Settings'),
        _buildListTile(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage your notification preferences',
          onTap: () => controller.selectMenuItem('notifications'),
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
          onTap: () => controller.selectMenuItem('language'),
        ),

        const Divider(height: 32),

        // Business Settings Section
        _buildSectionHeader('Business Settings'),
        _buildListTile(
          icon: Icons.business,
          title: 'Business Profile',
          subtitle: 'Manage your rental business details',
          onTap: () => controller.selectMenuItem('business_profile'),
        ),
        _buildListTile(
          icon: Icons.payment,
          title: 'Payment Methods',
          subtitle: 'Manage payment options',
          onTap: () => controller.selectMenuItem('payment_methods'),
        ),

        const Divider(height: 32),

        // Support Section
        _buildSectionHeader('Support'),
        _buildListTile(
          icon: Icons.help,
          title: 'Help & FAQ',
          subtitle: 'Get help and find answers',
          onTap: () => controller.selectMenuItem('help'),
        ),
        _buildListTile(
          icon: Icons.contact_support,
          title: 'Contact Support',
          subtitle: 'Reach out to our support team',
          onTap: () => controller.selectMenuItem('contact_support'),
        ),
        _buildListTile(
          icon: Icons.info,
          title: 'About',
          subtitle: 'App version and information',
          onTap: () => controller.selectMenuItem('about'),
        ),
      ],
    );
  }

  // Individual content screens
  Widget _buildEditProfileContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          Text('Edit Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          // Add your edit profile form here
          TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.snackbar('Success', 'Profile updated successfully');
            },
            child: Text('Update Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePasswordContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          Text('Change Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm New Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.snackbar('Success', 'Password changed successfully');
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsContent() {
    return Padding(
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
    );
  }

  Widget _buildLanguageContent() {
    return Padding(
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
    );
  }

  Widget _buildBusinessProfileContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          Text('Business Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Business Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Business Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Tax ID',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsContent() {
    return Padding(
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
    );
  }

  Widget _buildHelpContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.5,
            children: [
              _buildHelpCard(
                icon: Icons.mouse_outlined,
                title: 'Getting started',
                // onTap: () => _navigateToSection(context, 'Getting started'),
              ),
              _buildHelpCard(
                icon: Icons.auto_awesome_outlined,
                title: 'AI',
                // onTap: () => _navigateToSection(context, 'AI'),
              ),
              _buildHelpCard(
                icon: Icons.account_circle_outlined,
                title: 'Accounts & Workspaces',
                // onTap: () =>
                //     _navigateToSection(context, 'Accounts & Workspaces'),
              ),
              _buildHelpCard(
                icon: Icons.design_services_outlined,
                title: 'Design & accessibility',
                // onTap: () =>
                //     _navigateToSection(context, 'Design & accessibility'),
              ),
              _buildHelpCard(
                icon: Icons.cloud_outlined,
                title: 'Hosting & domains',
                // onTap: () => _navigateToSection(context, 'Hosting & domains'),
              ),
              _buildHelpCard(
                icon: Icons.analytics_outlined,
                title: 'Site management & SEO',
                // onTap: () =>
                //     _navigateToSection(context, 'Site management & SEO'),
              ),
              _buildHelpCard(
                icon: Icons.insights_outlined,
                title: 'Insights',
                // onTap: () => _navigateToSection(context, 'Insights'),
              ),
              _buildHelpCard(
                icon: Icons.language_outlined,
                title: 'Localization',
                // onTap: () => _navigateToSection(context, 'Localization'),
              ),
              _buildHelpCard(
                icon: Icons.dynamic_form_outlined,
                title: 'Forms & Logic',
                // onTap: () => _navigateToSection(context, 'Forms & Logic'),
              ),
              _buildHelpCard(
                icon: Icons.extension_outlined,
                title: 'Marketplace &\nIntegrations',
                // onTap: () =>
                //     _navigateToSection(context, 'Marketplace & Integrations'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({
    required IconData icon,
    required String title,
    // required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: Colors.blue[600],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSupportContent() {
    return Padding(
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
    );
  }

  Widget _buildAboutContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(),
          Text('About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('App Version: 1.0.0'),
          SizedBox(height: 10),
          Text('Build Number: 100'),
          SizedBox(height: 10),
          Text('© 2024 Your Company Name'),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    switch (controller.selectedMenuItem.value) {
      case 'settings':
        return _buildSettingsContent();
      case 'edit_profile':
        return _buildEditProfileContent();
      case 'change_password':
        return _buildChangePasswordContent();
      case 'notifications':
        return _buildNotificationsContent();
      case 'language':
        return _buildLanguageContent();
      case 'business_profile':
        return _buildBusinessProfileContent();
      case 'payment_methods':
        return _buildPaymentMethodsContent();
      case 'help':
        return _buildHelpContent();
      case 'contact_support':
        return _buildContactSupportContent();
      case 'about':
        return _buildAboutContent();
      default:
        return _buildSettingsContent();
    }
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => controller.selectMenuItem('settings'),
          ),
          Text('Back to Settings', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

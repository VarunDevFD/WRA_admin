import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpContent extends StatelessWidget {
  const HelpContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildBackButton(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: (isMobile || isTablet) ? 2 : 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: [
                _buildHelpCard(
                  context,
                  icon: Icons.mouse_outlined,
                  title: 'Getting started',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.auto_awesome_outlined,
                  title: 'AI',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.account_circle_outlined,
                  title: 'Accounts & Workspaces',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.design_services_outlined,
                  title: 'Design & accessibility',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.cloud_outlined,
                  title: 'Hosting & domains',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.analytics_outlined,
                  title: 'Site management & SEO',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.insights_outlined,
                  title: 'Insights',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.language_outlined,
                  title: 'Localization',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.dynamic_form_outlined,
                  title: 'Forms & Logic',
                ),
                _buildHelpCard(
                  context,
                  icon: Icons.extension_outlined,
                  title: 'Marketplace &\nIntegrations',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCard(
    BuildContext context, {
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
          padding: EdgeInsets.all(20.0),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';

class TopBarWidget extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: controller.getTimeBasedColors(),
                ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Text(
                  'Welcome to Rental Web Application Admin! 👋',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Here\'s what\'s happening with your rental business today',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          Row(
            children: [
              _buildTodayDate(),
              SizedBox(width: 16),
              _buildNotificationPopup(),
              SizedBox(width: 16),
              _buildAdminAvatar(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTodayDate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 16, color: Colors.blue[600]),
          SizedBox(width: 8),
          Text(
            'Today: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            style: TextStyle(
              color: Colors.blue[600],
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationPopup() {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: Offset(0, 50),
      constraints: BoxConstraints(maxWidth: 300),
      tooltip: 'Notifications',
      itemBuilder: (_) => [
        PopupMenuItem(
          enabled: false,
          child: Obx(() {
            final hasNotifications = controller.notifications.isNotEmpty;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Notifications',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    if (hasNotifications)
                      TextButton(
                        onPressed: () => controller.markAllAsRead(),
                        child: Text("Read All"),
                      ),
                  ],
                ),
                Divider(),
                if (!hasNotifications)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('No new notifications'),
                  )
                else
                  ...List.generate(controller.notifications.length, (index) {
                    final msg = controller.notifications[index];
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(msg),
                      onTap: () => controller.markAsDone(index),
                      trailing: IconButton(
                        icon: Icon(Icons.check_circle_outline,
                            color: Colors.green),
                        onPressed: () => controller.markAsDone(index),
                      ),
                    );
                  }),
              ],
            );
          }),
        ),
      ],
      icon: Stack(
        children: [
          Icon(Icons.notifications_outlined, size: 24, color: Colors.black87),
          if (controller.notifications.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAdminAvatar() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: controller.adminEmail,
        textStyle: TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Text(
              controller.adminEmail.isNotEmpty
                  ? controller.adminEmail[0].toUpperCase()
                  : 'V',
              style: TextStyle(
                color: Color(0xFF667eea),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

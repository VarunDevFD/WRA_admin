import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wdr/app/controllers/dashboard_controller/dashboard_main_controller.dart';

class TopBarWidget extends StatelessWidget {
  final DashboardController controller = Get.find<DashboardController>();

  TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    // Responsive font sizes, padding, and height
    final double titleFontSize = isMobile
        ? 14.0
        : isTablet
            ? 16.0
            : 18.0;
    final double subtitleFontSize = isMobile
        ? 10.0
        : isTablet
            ? 12.0
            : 13.0;
    final double padding = isMobile
        ? 8.0
        : isTablet
            ? 12.0
            : 16.0;
    final double containerHeight = isMobile
        ? 60.0
        : isTablet
            ? 70.0
            : 80.0;
    final double iconSize = isMobile
        ? 18.0
        : isTablet
            ? 22.0
            : 24.0;

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildTextSection(
                          context,
                          titleFontSize,
                          subtitleFontSize,
                          padding,
                        ),
                      ),
                      Row(
                        children: [
                          _buildNotificationPopup(iconSize),
                          SizedBox(width: padding * 0.5),
                          _buildAdminAvatar(iconSize),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildTextSection(
                    context,
                    titleFontSize,
                    subtitleFontSize,
                    padding,
                  ),
                ),
                Row(
                  children: [
                    _buildTodayDate(iconSize, padding),
                    SizedBox(width: padding),
                    _buildNotificationPopup(iconSize),
                    SizedBox(width: padding),
                    _buildAdminAvatar(iconSize),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildTextSection(
    BuildContext context,
    double titleFontSize,
    double subtitleFontSize,
    double padding,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: controller.getTimeBasedColors(),
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Flexible(
            child: Text(
              'Welcome to Rental Web Application Admin! 👋',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        SizedBox(height: padding * 0.5),
        Flexible(
          child: Text(
            'Here\'s what\'s happening with your rental business today',
            style: TextStyle(
              fontSize: subtitleFontSize,
              color: Colors.grey[600],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildTodayDate(double iconSize, double padding) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today,
              size: iconSize * 0.8, color: Colors.blue[600]),
          SizedBox(width: padding * 0.5),
          Text(
            'Today: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            style: TextStyle(
              color: Colors.blue[600],
              fontWeight: FontWeight.w500,
              fontSize: iconSize * 0.6,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationPopup(double iconSize) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: const Offset(0, 50),
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
                    const Text('Notifications',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    if (hasNotifications)
                      TextButton(
                        onPressed: () => controller.markAllAsRead(),
                        child: const Text("Read All"),
                      ),
                  ],
                ),
                const Divider(),
                if (!hasNotifications)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('No new notifications'),
                  )
                else
                  ...List.generate(controller.notifications.length, (index) {
                    final msg = controller.notifications[index];
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        msg,
                        style: TextStyle(fontSize: iconSize * 0.6),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      onTap: () => controller.markAsDone(index),
                      trailing: IconButton(
                        icon: Icon(Icons.check_circle_outline,
                            color: Colors.green, size: iconSize * 0.8),
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
          Icon(Icons.notifications_outlined,
              size: iconSize, color: Colors.black87),
          if (controller.notifications.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: iconSize * 0.3,
                height: iconSize * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAdminAvatar(double iconSize) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: controller.adminEmail,
        textStyle: const TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: iconSize * 0.8,
            backgroundColor: Colors.white,
            child: Text(
              controller.adminEmail.isNotEmpty
                  ? controller.adminEmail[0].toUpperCase()
                  : 'V',
              style: TextStyle(
                color: const Color(0xFF667eea),
                fontWeight: FontWeight.bold,
                fontSize: iconSize * 0.7,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

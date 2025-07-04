import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wdr/app/views/anaytics/analytics_screen.dart';
import 'package:wdr/app/views/booking/bookings_screen.dart';
import 'package:wdr/app/views/customers/customers_screen.dart';
import 'package:wdr/app/views/dashboard/dashboard_view.dart';
import 'package:wdr/app/views/authentication/login_view.dart';
import 'package:wdr/app/views/rentals/rental_screen.dart';
import 'package:wdr/app/views/settings/setting_view.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_aboutcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_businessprofile_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_contactsupport_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_helpcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_language_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_notification_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_passwordcontent_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_paymentmethod_widget.dart';
import 'package:wdr/app/views/settings/widgets/settings_body_profilecontent_widget.dart';
import 'package:wdr/app/views/splash_screen.dart';

class AppPages {
  static const initial = '/login';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashView()),
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/dashboard', page: () => DashboardView()),
    GetPage(name: '/rentals', page: () => RentalView()),
    GetPage(name: '/customers', page: () => CustomersView()),
    GetPage(name: '/bookings', page: () => BookingsView()),
    GetPage(name: '/analytics', page: () => AnalyticsView()),
    GetPage(name: '/settings', page: () => SettingsView()),
    GetPage(name: '/settings/profile', page: () => ProfileContent()),
    GetPage(
        name: '/settings/change_password', page: () => ChangePasswordContent()),
    GetPage(
        name: '/settings/notifications', page: () => NotificationsContent()),
    GetPage(name: '/settings/language', page: () => LanguageContent()),
    GetPage(
        name: '/settings/business_profile',
        page: () => BusinessProfileContent()),
    GetPage(
        name: '/settings/payment_methods', page: () => PaymentMethodsContent()),
    GetPage(name: '/settings/help', page: () => HelpContent()),
    GetPage(
        name: '/settings/contact_support', page: () => ContactSupportContent()),
    GetPage(name: '/settings/about', page: () => AboutContent()),
  ];
}
